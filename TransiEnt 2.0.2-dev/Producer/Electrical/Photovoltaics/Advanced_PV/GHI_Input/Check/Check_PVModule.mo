﻿within TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.GHI_Input.Check;
model Check_PVModule



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





  extends TransiEnt.Basics.Icons.Checkmodel;
  inner TransiEnt.SimCenter simCenter(v_n=400)
                                      annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  inner TransiEnt.ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  TransiEnt.Basics.Tables.Ambient.GHI_Hamburg_3600s_2012_TMY gHI_Hamburg_3600s_0101_3112_IWECfile1 annotation (Placement(transformation(extent={{-66,-10},{-46,10}})));
  TransiEnt.Basics.Tables.Ambient.Temperature_Hamburg_Fuhlsbuettel_3600s_2012 temperature_Hamburg_3600s_IWEC_from_SAM annotation (Placement(transformation(extent={{-64,40},{-44,60}})));
  TransiEnt.Basics.Tables.Ambient.Wind_Hamburg_3600s_TMY wind_Hamburg_3600s_01012012_31122012_Wind_Hamburg_175m annotation (Placement(transformation(extent={{-64,-76},{-44,-56}})));
public
function plotResult

  constant String resultFileName="Check_PVModule.mat";

  output String resultFile;

algorithm
  clearlog();
  assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)),
    "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile := TransiEnt.Basics.Functions.fullPathName(
    Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)
     + "/" + resultFileName);
  removePlots();
  createPlot(
    id=3,
    position={809,0,791,695},
    y={"singlePhasePVInverter.epp_AC.P","gHI_Hamburg_3600s_0101_3112_IWECfile1.y1"},
    range={0.0,1700000.0,-50.0,250.0},
    autoscale=false,
    grid=true,
    colors={{28,108,200},{238,46,47}},
    range2={0.15000000000000002,0.4},
    filename=resultFile);
  createPlot(
    id=3,
    position={809,0,791,229},
    y={"temperature_Hamburg_3600s_IWEC_from_SAM.y1"},
    range={0.0,1700000.0,-10.0,15.0},
    autoscale=false,
    grid=true,
    subPlot=2,
    colors={{28,108,200}},
    filename=resultFile);
  createPlot(
    id=3,
    position={809,0,791,228},
    y={"wind_Hamburg_3600s_01012012_31122012_Wind_Hamburg_175m.y1"},
    range={0.0,1700000.0,0.0,20.0},
    autoscale=false,
    grid=true,
    subPlot=3,
    colors={{28,108,200}},
    filename=resultFile);
  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  SinglePhasePVInverter singlePhasePVInverter(
    cosphi=0.9,
    behavior=-1,                                               P_PV=200)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  PVModule pVModule
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  TransiEnt.Components.Boundaries.Electrical.ApparentPower.FrequencyVoltage
    ElectricGrid(
    Use_input_connector_f=false,
    Use_input_connector_v=false,
    v_boundary=400)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
equation
  connect(singlePhasePVInverter.epp_DC, pVModule.epp) annotation (Line(
      points={{20.2,0},{-0.7,-0.6}},
      color={0,135,135},
      thickness=0.5));
  connect(pVModule.T_in, temperature_Hamburg_3600s_IWEC_from_SAM.y1)
    annotation (Line(points={{-22,8},{-22,50},{-43,50}}, color={0,0,127}));
  connect(pVModule.GHI_in, gHI_Hamburg_3600s_0101_3112_IWECfile1.y1)
    annotation (Line(points={{-22,0},{-45,0}}, color={0,0,127}));
  connect(pVModule.WindSpeed_in,
    wind_Hamburg_3600s_01012012_31122012_Wind_Hamburg_175m.y1)
    annotation (Line(points={{-22,-8},{-22,-66},{-43,-66}}, color={0,0,127}));
  connect(ElectricGrid.epp, singlePhasePVInverter.epp_AC) annotation (Line(
      points={{60,0},{40,0}},
      color={0,127,0},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    experiment(StopTime=3.1536e+007, Interval=3600),
    __Dymola_experimentSetupOutput(events=false),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for the pVModule model</p>
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
end Check_PVModule;
