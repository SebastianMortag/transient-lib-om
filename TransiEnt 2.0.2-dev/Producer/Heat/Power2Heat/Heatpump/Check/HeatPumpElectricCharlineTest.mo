﻿within TransiEnt.Producer.Heat.Power2Heat.Heatpump.Check;
model HeatPumpElectricCharlineTest



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
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=308.15) annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-50,22})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=1500,
    f=1/86400,
    offset=2000) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-90,50})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency ElectricGrid annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-16,50})));
  Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(extent={{-74,46},{-66,54}})));
  Modelica.Blocks.Sources.Sine sine2(
    f=1/86400,
    amplitude=15,
    phase=1.5707963267949,
    offset=-5 + 273.15) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-70,80})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature1(T=308.15)
                                                                                    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={60,22})));
  Modelica.Blocks.Sources.Sine sine1(
    amplitude=1500,
    f=1/86400,
    offset=2000) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={20,50})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency ElectricGrid1 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={90,50})));
  Modelica.Blocks.Sources.Sine sine3(
    f=1/86400,
    amplitude=15,
    phase=1.5707963267949,
    offset=-5 + 273.15) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={40,80})));
  Modelica.Blocks.Sources.Sine sine4(
    amplitude=1500,
    f=1/86400,
    offset=2000) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-90,-70})));
  .TransiEnt.Producer.Heat.Power2Heat.Heatpump.HeatPumpElectricCharline heatPump2(
    use_T_source_input_K=true,
    COP_n=4,
    usePowerPort=true) annotation (Placement(transformation(extent={{-60,-80},{-40,-60}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency ElectricGrid2 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-20,-70})));
  Modelica.Blocks.Math.Gain gain1(k=-1)
                                       annotation (Placement(transformation(extent={{-74,-74},{-66,-66}})));
  Modelica.Blocks.Sources.Sine sine5(
    f=1/86400,
    amplitude=15,
    phase=1.5707963267949,
    offset=-5 + 273.15) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={-70,-40})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_Txim_flow boundaryVLE_Txim_flow(variable_m_flow=false, boundaryConditions(m_flow_const=1)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-100})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_pTxi boundaryVLE_pTxi(boundaryConditions(p_const(displayUnit="bar") = 100000)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,-100})));
  Modelica.Blocks.Sources.Sine sine6(
    amplitude=1500,
    f=1/86400,
    offset=2000) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={20,-70})));
  .TransiEnt.Producer.Heat.Power2Heat.Heatpump.HeatPumpElectricCharline heatPump3(
    use_T_source_input_K=true,
    COP_n=4,
    usePowerPort=true,
    use_Q_flow_input=false) annotation (Placement(transformation(extent={{50,-80},{70,-60}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency ElectricGrid3 annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={90,-70})));
  Modelica.Blocks.Sources.Sine sine7(
    f=1/86400,
    amplitude=15,
    phase=1.5707963267949,
    offset=-5 + 273.15) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=180,
        origin={40,-40})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_Txim_flow boundaryVLE_Txim_flow1(variable_m_flow=false, boundaryConditions(m_flow_const=1)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,-100})));
  TransiEnt.Components.Boundaries.FluidFlow.BoundaryVLE_pTxi boundaryVLE_pTxi1(boundaryConditions(p_const(displayUnit="bar") = 100000)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,-100})));
  .TransiEnt.Producer.Heat.Power2Heat.Heatpump.HeatPumpElectricCharline heatPump(
    use_T_source_input_K=true,
    useFluidPorts=false,
    usePowerPort=true) annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  .TransiEnt.Producer.Heat.Power2Heat.Heatpump.HeatPumpElectricCharline heatPump1(
    use_Q_flow_input=false,
    use_T_source_input_K=true,
    useFluidPorts=false,
    usePowerPort=true) annotation (Placement(transformation(extent={{50,40},{70,60}})));
  inner SimCenter simCenter annotation (Placement(transformation(extent={{-12,80},{8,100}})));
equation
  connect(gain.y, heatPump.Q_flow_set) annotation (Line(points={{-65.6,50},{-60,50}}, color={0,0,127}));
  connect(sine.y, gain.u) annotation (Line(points={{-79,50},{-74.8,50}},
                                                                       color={0,0,127}));
  connect(heatPump1.heat, fixedTemperature1.port) annotation (Line(points={{60,40},{60,32}}, color={191,0,0}));
  connect(gain1.y, heatPump2.Q_flow_set) annotation (Line(points={{-65.6,-70},{-60,-70}}, color={0,0,127}));
  connect(sine4.y, gain1.u) annotation (Line(points={{-79,-70},{-74.8,-70}}, color={0,0,127}));
  connect(sine5.y, heatPump2.T_source_input_K) annotation (Line(points={{-59,-40},{-50,-40},{-50,-60}}, color={0,0,127}));
  connect(heatPump.epp, ElectricGrid.epp) annotation (Line(
      points={{-40,50},{-26,50}},
      color={0,135,135},
      thickness=0.5));
  connect(ElectricGrid1.epp, heatPump1.epp) annotation (Line(
      points={{80,50},{70,50}},
      color={0,135,135},
      thickness=0.5));
  connect(ElectricGrid2.epp, heatPump2.epp) annotation (Line(
      points={{-30,-70},{-40,-70}},
      color={0,135,135},
      thickness=0.5));
  connect(boundaryVLE_pTxi.fluidPortIn, heatPump2.waterPortOut) annotation (Line(
      points={{-30,-90},{-30,-80},{-46,-80}},
      color={175,0,0},
      thickness=0.5));
  connect(boundaryVLE_Txim_flow.fluidPortOut, heatPump2.waterPortIn) annotation (Line(
      points={{-70,-90},{-70,-80},{-54,-80}},
      color={175,0,0},
      thickness=0.5));
  connect(sine7.y, heatPump3.T_source_input_K) annotation (Line(points={{51,-40},{60,-40},{60,-60}}, color={0,0,127}));
  connect(ElectricGrid3.epp, heatPump3.epp) annotation (Line(
      points={{80,-70},{70,-70}},
      color={0,135,135},
      thickness=0.5));
  connect(boundaryVLE_pTxi1.fluidPortIn, heatPump3.waterPortOut) annotation (Line(
      points={{80,-90},{80,-80},{64,-80}},
      color={175,0,0},
      thickness=0.5));
  connect(boundaryVLE_Txim_flow1.fluidPortOut, heatPump3.waterPortIn) annotation (Line(
      points={{40,-90},{40,-80},{56,-80}},
      color={175,0,0},
      thickness=0.5));
  connect(sine6.y, heatPump3.P_el_set) annotation (Line(points={{31,-70},{40,-70},{40,-61.8},{50,-61.8}},
                                                                                    color={0,0,127}));
  connect(gain.y, heatPump.Q_flow_set) annotation (Line(points={{-65.6,50},{-60,50}}, color={0,0,127}));
  connect(heatPump.heat, fixedTemperature.port) annotation (Line(points={{-50,40},{-50,32}}, color={191,0,0}));
  connect(sine2.y, heatPump.T_source_input_K) annotation (Line(points={{-59,80},{-50,80},{-50,60}}, color={0,0,127}));
  connect(fixedTemperature1.port, heatPump1.heat) annotation (Line(points={{60,32},{60,40}}, color={191,0,0}));
  connect(ElectricGrid1.epp, heatPump1.epp) annotation (Line(
      points={{80,50},{70,50}},
      color={0,135,135},
      thickness=0.5));
  connect(sine3.y, heatPump1.T_source_input_K) annotation (Line(points={{51,80},{60,80},{60,60}}, color={0,0,127}));
  connect(sine1.y, heatPump1.P_el_set) annotation (Line(points={{31,50},{42,50},{42,58.2},{50,58.2}}, color={0,0,127}));
  annotation (
    Icon(graphics,
         coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{100,100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-120},{100,100}}), graphics={Text(
          extent={{-76,20},{60,-44}},
          textColor={28,108,200},
          textString="Look at and compare: ElectriGridX.epp.p, 
heatPumpX.Q_flow and 
boundaryVLE_pTxi.eye.T")}),
    experiment(StopTime=432000, Interval=900),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for HeatPumpElectricCharline</p>
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
end HeatPumpElectricCharlineTest;
