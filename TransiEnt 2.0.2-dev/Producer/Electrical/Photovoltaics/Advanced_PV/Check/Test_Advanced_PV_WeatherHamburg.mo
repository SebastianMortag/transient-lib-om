﻿within TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.Check;
model Test_Advanced_PV_WeatherHamburg



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
  inner TransiEnt.SimCenter simCenter
    annotation (Placement(transformation(extent={{-248,218},{-228,238}})));
  inner TransiEnt.ModelStatistics modelStatistics
    annotation (Placement(transformation(extent={{-238,218},{-218,238}})));
  TransiEnt.Basics.Tables.Ambient.DNI_Hamburg_3600s_2012_TMY
    DNI_Hamburg_3600s_IWEC
    annotation (Placement(transformation(extent={{-214,36},{-194,56}})));
  TransiEnt.Basics.Tables.Ambient.DHI_Hamburg_3600s_2012_TMY
    DHI_Hamburg_3600s_IWEC
    annotation (Placement(transformation(extent={{-214,4},{-194,24}})));
  TransiEnt.Basics.Tables.Ambient.Temperature_Hamburg_Fuhlsbuettel_3600s_2012
    Temperature_Hamburg_3600s_IWEC
    annotation (Placement(transformation(extent={{-214,-46},{-194,-26}})));
  TransiEnt.Basics.Tables.Ambient.Wind_Hamburg_3600s_TMY
    Wind_Hamburg_3600s_IWEC
    annotation (Placement(transformation(extent={{-214,-90},{-194,-70}})));
  TransiEnt.Basics.Tables.Ambient.GHI_Hamburg_3600s_2012_TMY
    GHI_Hamburg_3600s_IWEC
    annotation (Placement(transformation(extent={{-214,-124},{-194,-106}})));
  TransiEnt.Components.Boundaries.Electrical.ActivePower.Frequency
    ElectricGrid
    annotation (Placement(transformation(extent={{84,-10},{104,10}})));
  TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.GHI_Input.PVPlant
    GHI_Input_0(
    P_inst=200000,
    Area=1.18,
    Strings=83,
    GroundCoverageRatio=2,
    latitude=Modelica.Units.Conversions.from_deg(53.63),
    slope=Modelica.Units.Conversions.from_deg(0),
    redeclare model Skymodel =
        TransiEnt.Producer.Heat.SolarThermal.Base.Skymodel_HDKR,
    integratePowerDc=true,
    integratePowerOut=true)
    annotation (Placement(transformation(extent={{-16,192},{4,212}})));
  TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.DNIDHI_Input.PVPlant
    DNIDHI_Input_0(
    P_inst=200000,
    Area=1.18,
    Strings=83,
    GroundCoverageRatio=2,
    latitude=Modelica.Units.Conversions.from_deg(53.63),
    slope=Modelica.Units.Conversions.from_deg(0),
    redeclare model Skymodel =
        TransiEnt.Producer.Heat.SolarThermal.Base.Skymodel_HDKR,
    integratePowerDc=true,
    integratePowerOut=true)
    annotation (Placement(transformation(extent={{-16,152},{4,172}})));
  TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.DNIDHI_Input.PVPlant
    DNIDHI_Input_30(
    Area=1.18,
    Strings=83,
    P_inst=200000,
    GroundCoverageRatio=2,
    latitude=Modelica.Units.Conversions.from_deg(53.63),
    slope=Modelica.Units.Conversions.from_deg(30),
    redeclare model Skymodel =
        TransiEnt.Producer.Heat.SolarThermal.Base.Skymodel_HDKR,
    integratePowerDc=true,
    integratePowerOut=true)
    annotation (Placement(transformation(extent={{-12,-26},{8,-6}})));
  TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.GHI_Input.PVPlant
    GHI_Input_30(
    P_inst=200000,
    Area=1.18,
    Strings=83,
    GroundCoverageRatio=2,
    latitude=Modelica.Units.Conversions.from_deg(53.63),
    slope=Modelica.Units.Conversions.from_deg(30),
    redeclare model Skymodel =
        TransiEnt.Producer.Heat.SolarThermal.Base.Skymodel_HDKR,
    integratePowerDc=true,
    integratePowerOut=true)
    annotation (Placement(transformation(extent={{-12,14},{8,34}})));
  TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.DNIDHI_Input.PVPlant
    DNIDHI_Input_60(
    P_inst=200000,
    Area=1.18,
    Strings=83,
    GroundCoverageRatio=2,
    latitude=Modelica.Units.Conversions.from_deg(53.63),
    slope=Modelica.Units.Conversions.from_deg(60),
    redeclare model Skymodel =
        TransiEnt.Producer.Heat.SolarThermal.Base.Skymodel_HDKR,
    integratePowerDc=true,
    integratePowerOut=true)
    annotation (Placement(transformation(extent={{-12,-170},{8,-150}})));
  TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.GHI_Input.PVPlant
    GHI_Input_60(
    P_inst=200000,
    Area=1.18,
    Strings=83,
    GroundCoverageRatio=2,
    latitude=Modelica.Units.Conversions.from_deg(53.63),
    slope=Modelica.Units.Conversions.from_deg(60),
    redeclare model Skymodel =
        TransiEnt.Producer.Heat.SolarThermal.Base.Skymodel_HDKR,
    integratePowerDc=true,
    integratePowerOut=true)
    annotation (Placement(transformation(extent={{-12,-130},{8,-110}})));

  // _____________________________________________
  //
  //           Functions
  // _____________________________________________

  function plotResult

    constant String resultFileName="Test_Advanced_PV_WeatherHamburg.mat";

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
          id=1,
          position={784,0,766,855},
          y={"GHI_Input_0.E","DNIDHI_Input_0.E"},
          range={0.0,32000000.0,-100000000000.0,700000000000.0},
          grid=true,
          colors={{28,108,200},{238,46,47}},
          filename=resultFile);
    createPlot(
          id=1,
          position={784,0,766,281},
          y={"GHI_Input_30.E","DNIDHI_Input_30.E"},
          range={0.0,32000000.0,-100000000000.0,700000000000.0},
          grid=true,
          subPlot=2,
          colors={{28,108,200},{238,46,47}},
          filename=resultFile);
    createPlot(
          id=1,
          position={784,0,766,282},
          y={"GHI_Input_60.E","DNIDHI_Input_60.E"},
          range={0.0,32000000.0,-100000000000.0,700000000000.0},
          grid=true,
          subPlot=3,
          colors={{28,108,200},{238,46,47}},
          filename=resultFile);
    createPlot(
          id=2,
          position={0,0,768,855},
          y={"GHI_Input_0.der(E)","DNIDHI_Input_0.der(E)"},
          range={0.0,32000000.0,-20000.0,160000.0},
          grid=true,
          colors={{28,108,200},{238,46,47}},
          filename=resultFile);
    createPlot(
          id=2,
          position={0,0,768,281},
          y={"GHI_Input_30.der(E)","DNIDHI_Input_30.der(E)"},
          range={0.0,32000000.0,-50000.0,200000.0},
          grid=true,
          subPlot=2,
          colors={{28,108,200},{238,46,47}},
          filename=resultFile);
    createPlot(
          id=2,
          position={0,0,768,282},
          y={"GHI_Input_60.der(E)","DNIDHI_Input_60.der(E)"},
          range={0.0,32000000.0,-50000.0,200000.0},
          grid=true,
          subPlot=3,
          colors={{28,108,200},{238,46,47}},
          filename=resultFile);
    resultFile := "Successfully plotted results for file: " + resultFile;
  end plotResult;

equation
  connect(DNI_Hamburg_3600s_IWEC.value, DNIDHI_Input_0.DNI_in) annotation (
      Line(points={{-195.2,46},{-148,46},{-148,164.4},{-18,164.4}}, color={0,0,
          127}));
  connect(DHI_Hamburg_3600s_IWEC.value, DNIDHI_Input_0.DHI_in) annotation (
      Line(points={{-195.2,14},{-142,14},{-142,159.4},{-18,159.4}}, color={0,0,
          127}));
  connect(Wind_Hamburg_3600s_IWEC.value, DNIDHI_Input_0.WindSpeed_in)
    annotation (Line(points={{-195.2,-80},{-176,-80},{-176,148},{-158,148},{-18,
          148},{-18,154}}, color={0,0,127}));
  connect(Temperature_Hamburg_3600s_IWEC.value, DNIDHI_Input_0.T_in)
    annotation (Line(points={{-195.2,-36},{-136,-36},{-136,170},{-18,170}},
        color={0,0,127}));
  connect(Temperature_Hamburg_3600s_IWEC.value, GHI_Input_0.T_in) annotation (
     Line(points={{-195.2,-36},{-136,-36},{-136,210},{-18,210}}, color={0,0,127}));
  connect(GHI_Input_0.epp, ElectricGrid.epp) annotation (Line(
      points={{3.3,201.4},{83.65,201.4},{83.65,0},{84,0}},
      color={0,135,135},
      thickness=0.5));
  connect(DNIDHI_Input_0.epp, ElectricGrid.epp) annotation (Line(
      points={{3.3,161.4},{3.3,161.7},{84,161.7},{84,0}},
      color={0,135,135},
      thickness=0.5));
  connect(GHI_Hamburg_3600s_IWEC.value, GHI_Input_0.GHI_in) annotation (Line(
        points={{-195.2,-115},{-136,-115},{-126,-115},{-126,202},{-18,202}},
        color={0,0,127}));
  connect(GHI_Hamburg_3600s_IWEC.value, GHI_Input_30.GHI_in) annotation (Line(
        points={{-195.2,-115},{-104.6,-115},{-104.6,24},{-14,24}}, color={0,0,
          127}));
  connect(GHI_Hamburg_3600s_IWEC.value, GHI_Input_60.GHI_in) annotation (Line(
        points={{-195.2,-115},{-103.6,-115},{-103.6,-120},{-14,-120}}, color={
          0,0,127}));
  connect(Wind_Hamburg_3600s_IWEC.value, DNIDHI_Input_30.WindSpeed_in)
    annotation (Line(points={{-195.2,-80},{-102,-80},{-102,-24},{-14,-24}},
        color={0,0,127}));
  connect(Wind_Hamburg_3600s_IWEC.value, DNIDHI_Input_60.WindSpeed_in)
    annotation (Line(points={{-195.2,-80},{-102,-80},{-102,-168},{-14,-168}},
        color={0,0,127}));
  connect(Temperature_Hamburg_3600s_IWEC.value, GHI_Input_30.T_in)
    annotation (Line(points={{-195.2,-36},{-102,-36},{-102,32},{-14,32}},
        color={0,0,127}));
  connect(Temperature_Hamburg_3600s_IWEC.value, DNIDHI_Input_30.T_in)
    annotation (Line(points={{-195.2,-36},{-102,-36},{-102,-8},{-14,-8}},
        color={0,0,127}));
  connect(Temperature_Hamburg_3600s_IWEC.value, GHI_Input_60.T_in)
    annotation (Line(points={{-195.2,-36},{-102,-36},{-102,-112},{-14,-112}},
        color={0,0,127}));
  connect(Temperature_Hamburg_3600s_IWEC.value, DNIDHI_Input_60.T_in)
    annotation (Line(points={{-195.2,-36},{-102,-36},{-102,-152},{-14,-152}},
        color={0,0,127}));
  connect(DNI_Hamburg_3600s_IWEC.value, DNIDHI_Input_30.DNI_in) annotation (
      Line(points={{-195.2,46},{-102,46},{-102,-13.6},{-14,-13.6}}, color={0,0,
          127}));
  connect(DNI_Hamburg_3600s_IWEC.value, DNIDHI_Input_60.DNI_in) annotation (
      Line(points={{-195.2,46},{-102,46},{-102,-157.6},{-14,-157.6}}, color={0,
          0,127}));
  connect(DHI_Hamburg_3600s_IWEC.value, DNIDHI_Input_30.DHI_in) annotation (
      Line(points={{-195.2,14},{-104,14},{-104,-18.6},{-14,-18.6}}, color={0,0,
          127}));
  connect(DHI_Hamburg_3600s_IWEC.value, DNIDHI_Input_60.DHI_in) annotation (
      Line(points={{-195.2,14},{-104,14},{-104,-162.6},{-14,-162.6}}, color={0,
          0,127}));
  connect(GHI_Input_30.epp, ElectricGrid.epp) annotation (Line(
      points={{7.3,23.4},{8.65,23.4},{8.65,0},{84,0}},
      color={0,135,135},
      thickness=0.5));
  connect(DNIDHI_Input_30.epp, ElectricGrid.epp) annotation (Line(
      points={{7.3,-16.6},{7.3,-16},{8,-16},{8,0},{9.3,0},{84,0},{84,0},{84,0}},
      color={0,135,135},
      thickness=0.5));

  connect(GHI_Input_60.epp, ElectricGrid.epp) annotation (Line(
      points={{7.3,-120.6},{7.3,-120.3},{84,-120.3},{84,0}},
      color={0,135,135},
      thickness=0.5));
  connect(DNIDHI_Input_60.epp, ElectricGrid.epp) annotation (Line(
      points={{7.3,-160.6},{7.3,-159.3},{84,-159.3},{84,0}},
      color={0,135,135},
      thickness=0.5));
  connect(Wind_Hamburg_3600s_IWEC.value, GHI_Input_60.WindSpeed_in)
    annotation (Line(points={{-195.2,-80},{-102,-80},{-102,-128},{-14,-128}},
        color={0,0,127}));
  connect(Wind_Hamburg_3600s_IWEC.value, GHI_Input_0.WindSpeed_in)
    annotation (Line(points={{-195.2,-80},{-195.2,191},{-18,191},{-18,194}},
        color={0,0,127}));
  connect(Wind_Hamburg_3600s_IWEC.value, GHI_Input_30.WindSpeed_in)
    annotation (Line(points={{-195.2,-80},{-102,-80},{-102,16},{-14,16}},
        color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(
        extent={{-260,-240},{260,240}},
        preserveAspectRatio=false,
        initialScale=0.1), graphics={Text(
            extent={{118,200},{216,168}},
            lineColor={28,108,200},
            textString="Module inclination: 0 "),Text(
            extent={{-88,-214},{82,-250}},
            lineColor={238,46,47},
            textString="ONLY FOR IRRADIATION RESULTS"),Text(
            extent={{122,20},{220,-12}},
            lineColor={28,108,200},
            textString="Module inclination: 30"),Text(
            extent={{122,-120},{220,-152}},
            lineColor={28,108,200},
            textString="Module inclination: 60")}),
    Icon(graphics, coordinateSystem(
        extent={{-260,-240},{260,240}},
        preserveAspectRatio=false,
        initialScale=0.1)),
    experiment(
      StopTime=3.1536e+007,
      Interval=3600,
      Tolerance=1e-008),
    __Dymola_experimentSetupOutput(events=false),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for testing the irradiation results in Hamburg</p>
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
end Test_Advanced_PV_WeatherHamburg;
