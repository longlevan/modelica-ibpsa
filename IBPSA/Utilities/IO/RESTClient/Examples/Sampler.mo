within IBPSA.Utilities.IO.RESTClient.Examples;
model Sampler
 extends Modelica.Icons.Example;
   inner IBPSA.Utilities.IO.RESTClient.Configuration config(
   samplePeriod=0.5,
   activation=IBPSA.Utilities.IO.RESTClient.Types.GlobalActivation.use_input)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  IBPSA.Utilities.IO.RESTClient.Sampler_Real sampler(
    numVar=2,
    samplePeriod=1,
    hostAddress="127.0.0.1",
    tcpPort=8888,
    oveSig(fixed=true)) annotation (Placement(transformation(extent={{0,-10},{20,10}})));

  Modelica.Blocks.Sources.Sine sine1(amplitude=2, freqHz=1/60)
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  Modelica.Blocks.Sources.Sine sine2(freqHz=1/30)
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=true)
    annotation (Placement(transformation(extent={{-20,68},{0,88}})));
equation
  connect(sine1.y, sampler.u[1]) annotation (Line(points={{-59,-40},{-60,-40},{-20,-40},{-20,-1},
          {-2,-1}},
                color={0,0,127}));
  connect(sine2.y, sampler.u[2])
    annotation (Line(points={{-59,20},{-20,20},{-20,1},{-2,1}}, color={0,0,127}));
  connect(booleanExpression.y, config.activate)
    annotation (Line(points={{1,78},{58,78}},           color={255,0,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
   experiment(Tolerance=1e-6, StartTime=0, StopTime=120),
__Dymola_Commands(file="modelica://IBPSA/Resources/Scripts/Dymola/Utilities/IO/RESTClient/Examples/Sampler.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This example demonstrates the use of a sampler that sends time series to a remoted server.
Please start the socket server
<code>IBPSA/Resources/src/SocketServer/Utilities/IO/RESTClient/Examples/Server.py</code>
before starting this example.
</p>
</html>"));
end Sampler;
