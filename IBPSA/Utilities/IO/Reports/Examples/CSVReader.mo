within IBPSA.Utilities.IO.Reports.Examples;
model CSVReader "Reader for csv files generated by CSVWriter"
  extends IBPSA.Utilities.IO.Reports.BaseClasses.PartialCSV;
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    tableOnFile=true,
    fileName="test.csv",
    columns={2,3},
    tableName="csv")
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=-1.21,
      StopTime=10,
      Tolerance=1e-06),
    __Dymola_Commands(file=
          "Resources/Scripts/Dymola/Utilities/IO/Reports/Examples/CSVReader.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>
This model demonstrates how a <code>CombiTimeTable</code> can be used
to read the CSV file that is generated by the 
<a href=\"modelica://IBPSA.Utilities.IO.Reports.CSVWriter\">CSVWriter</a>
from example 
<a href=\"modelica://IBPSA.Utilities.IO.Reports.Examples.CSVWriter\">CSVWriter</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
May 14, 2018 by Filip Jorissen:<br/>
First implementation.
See <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/924\">#924</a>.
</li>
</ul>
</html>"));
end CSVReader;