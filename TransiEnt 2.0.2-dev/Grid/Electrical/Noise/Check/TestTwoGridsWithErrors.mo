﻿within TransiEnt.Grid.Electrical.Noise.Check;
model TestTwoGridsWithErrors
  import TransiEnt;




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

record ExpectedResult
  constant Real delta_f_min_dynamic(unit="Hz")=50-800e-3;
  constant Real delta_f_min_stationary(unit="Hz")=50-180e-3;
end ExpectedResult;

ExpectedResult expectedResult;

  inner TransiEnt.ModelStatistics                    modelStatistics
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  inner TransiEnt.SimCenter simCenter(useThresh=true, P_n_low=148e9,
    P_n_ref_1=4e9,
    P_n_ref_2=296e9)
    annotation (Placement(transformation(extent={{-70,80},{-50,100}})));

  TransiEnt.Producer.Electrical.Conventional.LumpedGridGenerators LocalGrid(
    P_el_n=simCenter.P_n_ref_1,
    typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.Others,
    nSubgrid=1,
    beta=SC_K.k,
    T_r=SC_T.k,
    delta_pr=0.2/50/(3/150 - 0.2*0.01),
    k_pr=0.5,
    lambda_sec=simCenter.P_n_ref_1/(simCenter.P_n_ref_1 + simCenter.P_n_ref_2)*lambda_grid.k,
    is_running(fixed=false),
    fixedStartValue_w=false) annotation (Placement(transformation(extent={{-44,-50},{-10,-16}})));
  Modelica.Blocks.Sources.Step Gen_set(
    offset=-Load.k,
    height=P_Z.k,
    startTime=t_dist.k)
                   annotation (Placement(transformation(extent={{-90,-22},{-70,-2}})));
  Modelica.Blocks.Sources.Constant Load(k=2e9)         annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={70,14})));
  TransiEnt.Consumer.Electrical.LinearElectricConsumer LocalDem(kpf=0.5) annotation (Placement(transformation(
        extent={{-15,-15.5},{15,15.5}},
        rotation=0,
        origin={35,-23.5})));
  TransiEnt.Components.Sensors.ElectricActivePower P_tie_12(change_of_sign=true) "From grid 1 to grid 2" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-4,56})));
  Modelica.Blocks.Sources.Constant Gen_tie_set(k=0) annotation (Placement(transformation(extent={{-60,-2},{-40,18}})));
  Modelica.Blocks.Sources.Constant P_Z(k=3e9)   annotation (Placement(transformation(extent={{-100,-90},{-80,-70}})));
  Modelica.Blocks.Sources.Constant SC_T(k=150)  annotation (Placement(transformation(extent={{-60,-90},{-40,-70}})));
  Modelica.Blocks.Sources.Constant SC_K(k=0.5)  annotation (Placement(transformation(extent={{-20,-88},{0,-68}})));
  TransiEnt.Grid.Electrical.Base.TrumpetCurveAdvanced trumpetCurve1(P_Z=P_Z.k, t_dist=t_dist.k) annotation (Placement(transformation(extent={{40,-90},{60,-70}})));
  LumpedPowerGrid.LumpedGrid SurroundingGrid(
    beta=SC_K.k,
    T_r=SC_T.k,
    delta_pr=0.2/50/(3/150 - 0.2*0.01),
    k_pr=0.5,
    lambda_sec=simCenter.P_n_ref_2/(simCenter.P_n_ref_1 + simCenter.P_n_ref_2)*lambda_grid.k,
    redeclare TypicalLumpedGridError genericGridError) annotation (Placement(transformation(extent={{-58,42},{-26,70}})));
  Modelica.Blocks.Sources.Constant lambda_grid(k=3e9/0.2) "Total power frequency characteristic" annotation (Placement(transformation(extent={{78,-90},{98,-70}})));
  Modelica.Blocks.Sources.Constant t_dist(k=43200) annotation (Placement(transformation(extent={{14,-88},{34,-68}})));
equation

  connect(LocalGrid.epp, LocalDem.epp) annotation (Line(
      points={{-11.7,-21.1},{3.4,-21.1},{3.4,-23.5},{20.3,-23.5}},
      color={0,135,135},
      thickness=0.5,
      smooth=Smooth.None));
  connect(SurroundingGrid.epp, P_tie_12.epp_IN) annotation (Line(
      points={{-26,56},{-13.2,56}},
      color={0,135,135},
      thickness=0.5));
  connect(P_tie_12.epp_OUT, LocalGrid.epp) annotation (Line(
      points={{5.4,56},{6,56},{6,-8},{6,-21.1},{-11.7,-21.1}},
      color={0,135,135},
      thickness=0.5));
  connect(LocalGrid.P_tie_set, Gen_tie_set.y) annotation (Line(points={{-24.45,-17.87},{-24.45,8},{-39,8}}, color={0,0,127}));
  connect(LocalGrid.P_tie_is, P_tie_12.P) annotation (Line(points={{-17.65,-17.87},{-17.65,26},{-18,26},{-18,72},{-7.8,72},{-7.8,63.8}}, color={0,0,127}));
  connect(Load.y, LocalDem.P_el_set) annotation (Line(points={{59,14},{52,14},{35,14},{35,-5.52}},     color={0,0,127}));
  connect(Gen_set.y, LocalGrid.P_el_set) annotation (Line(points={{-69,-12},{-58,-12},{-58,-10},{-29.55,-10},{-29.55,-16.17}}, color={0,0,127}));
  annotation (Diagram(graphics,
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    experiment(
      StopTime=86400,
      Interval=60,
      Tolerance=1e-006,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput,
    Icon(graphics,
         coordinateSystem(extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This validation model produces results that correspond to Page A1-7 of the entso-e operational handbook appendix 1: Load-frequency control.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>[1] European Network of Transmission System Operators (ENTSO-E), &quot;System Operation Reports. Continental Europe Operation Handbook. Policies&quot;, URL: https://www.entsoe.eu/publications/system-operations-reports/#policies, 2018</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"),
    __Dymola_experimentFlags(
      Advanced(
        EvaluateAlsoTop=false,
        GenerateVariableDependencies=false,
        OutputModelicaCode=false),
      Evaluate=true,
      OutputCPUtime=true,
      OutputFlatModelica=false));
end TestTwoGridsWithErrors;
