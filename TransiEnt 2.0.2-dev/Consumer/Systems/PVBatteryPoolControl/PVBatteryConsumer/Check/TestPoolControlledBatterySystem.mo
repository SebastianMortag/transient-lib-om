﻿within TransiEnt.Consumer.Systems.PVBatteryPoolControl.PVBatteryConsumer.Check;
model TestPoolControlledBatterySystem



//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.2                             //
//                                                                                //
// Licensed by Hamburg University of Technology under the 3-BSD-clause.           //
// Copyright 2021, Hamburg University of Technology.                              //
//________________________________________________________________________________//
//                                                                                //
// TransiEnt.EE, ResiliEntEE, IntegraNet and IntegraNet II are research projects  //
// supported by the German Federal Ministry of Economics and Energy               //
// (FKZ 03ET4003, 03ET4048, 0324027 and 03EI1008).                                //
// The TransiEnt Library research team consists of the following project partners://
// Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
// Institute of Energy Systems (Hamburg University of Technology),                //
// Institute of Electrical Power and Energy Technology                            //
// (Hamburg University of Technology)                                             //
// Fraunhofer Institute for Environmental, Safety, and Energy Technology UMSICHT, //
// Gas- und Wärme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//





  extends Basics.Icons.Checkmodel;

model MinimalPoolController "Minimum Pool Controller model just for this tester"
  extends TransiEnt.Basics.Icons.Controller;
  Modelica.Blocks.Interfaces.RealInput P_el_set=param.P_el_max_bat;
  Base.PoolControlBus bus annotation (Placement(transformation(extent={{88,-14},{116,12}}), iconTransformation(
          extent={{-25.5,-21.5},{25.5,21.5}},
          rotation=90,
          origin={101.5,0.5})));
  outer Base.PoolParameter param;
equation
  for i in 1:param.nSystems loop
    connect(bus.P_el_set[i], P_el_set);
  end for;

end MinimalPoolController;
inner Base.PoolParameter param(nSystems=1) annotation (Placement(transformation(extent={{-92,71},{-72,91}})));

  MinimalPoolController ctrl annotation (Placement(transformation(extent={{-64,34},{-36,60}})));
  PoolControlledBatterySystem batterySystem annotation (Placement(transformation(extent={{-44,-30},{26,32}})));
  Components.Boundaries.Electrical.ActivePower.Frequency ElectricGrid annotation (Placement(transformation(extent={{42,-21},{62,-1}})));
equation
    connect(batterySystem.epp, ElectricGrid.epp) annotation (Line(
      points={{26,-11.4},{40,-11.4},{40,-11},{42,-11}},
      color={0,135,135},
      thickness=0.5));
    connect(ctrl.bus, batterySystem.poolControlBus) annotation (Line(
      points={{-35.79,47.065},{-9,47.065},{-9,31.38}},
      color={255,204,51},
      thickness=0.5));
public
function plotResult

  constant String resultFileName = "TestPoolControlledBatterySystem.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

  createPlot(id=2, position={0, 0, 1481, 851}, y={"ctrl.P_el_set", "batterySystem.batterySystem.storageModel.params.P_max_load",
  "batterySystem.insertP_el_is.y[1]"}, range={0.0, 18000.0, -500.0, 2000.0}, grid=true, colors={{28,108,200}, {238,46,47}, {0,140,72}},filename=resultFile);
  createPlot(id=2, position={0, 0, 1481, 281}, y={"batterySystem.batterySystem.batteryPowerLimit.P_max_load_star",
  "batterySystem.batterySystem.batteryPowerLimit.P_max_unload_star"}, range={0.0, 18000.0, -0.2, 1.2000000000000002}, grid=true, subPlot=2, colors={{28,108,200}, {238,46,47}},filename=resultFile);
  createPlot(id=2, position={0, 0, 1481, 280}, y={"batterySystem.SOC.y", "param.SOC_start"}, range={0.0, 18000.0, 0.4, 1.1}, grid=true, subPlot=3, colors={{28,108,200}, {238,46,47}},filename=resultFile);

  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
annotation (experiment(StopTime=18000), Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for the PoolControlledBatterySystem</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4.Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end TestPoolControlledBatterySystem;
