<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <RootNamespace>PropertyInjectorConsoleApplication</RootNamespace>
    <OutputType>Exe</OutputType>
    <AssemblyName>PropertyInjectorConsoleApplication</AssemblyName>
    <AllowGlobals>False</AllowGlobals>
    <AllowLegacyOutParams>False</AllowLegacyOutParams>
    <AllowLegacyCreate>False</AllowLegacyCreate>
    <ApplicationIcon>Properties\App.ico</ApplicationIcon>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
    <ProjectGuid>{7BFE241B-6AC9-46E3-A950-8719F5CA57BC}</ProjectGuid>
    <RunPostBuildEvent>㏡</RunPostBuildEvent>
    <Company />
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <OutputPath>.\bin\Debug</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <OutputPath>.\bin\Release</OutputPath>
    <EnableAsserts>False</EnableAsserts>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="mscorlib">
      <HintPath>mscorlib.dll</HintPath>
    </Reference>
    <ProjectReference Include="..\..\Prism.StandardAspects.DependencyInjection\Prism.StandardAspects.DependencyInjection.oxygene">
      <Project>{F040DD91-4C32-4554-8995-6938B4F34AD6}</Project>
      <HintPath>..\..\Prism.StandardAspects.DependencyInjection\bin\Debug\Prism.StandardAspects.DependencyInjection.dll</HintPath>
      <Name>Prism.StandardAspects.DependencyInjection</Name>
    </ProjectReference>
    <Reference Include="RemObjects.Oxygene.Cirrus">
      <HintPath>$(ProgramFiles)\CodeGear\Delphi Prism\Bin\RemObjects.Oxygene.Cirrus.dll</HintPath>
      <Name>RemObjects.Oxygene.Cirrus.dll</Name>
      <Private>True</Private>
    </Reference>
    <Reference Include="StructureMap">
      <HintPath>..\..\lib\StructureMap.dll</HintPath>
      <Name>StructureMap.dll</Name>
      <Private>True</Private>
    </Reference>
    <Reference Include="System">
      <HintPath>System.dll</HintPath>
    </Reference>
    <Reference Include="System.Core">
      <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.5\System.Core.dll</HintPath>
    </Reference>
    <Reference Include="System.Data">
      <HintPath>System.Data.dll</HintPath>
    </Reference>
    <Reference Include="System.Data.DataSetExtensions">
      <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.5\System.Data.DataSetExtensions.dll</HintPath>
    </Reference>
    <Reference Include="System.Xml">
      <HintPath>System.Xml.dll</HintPath>
    </Reference>
    <Reference Include="System.Xml.Linq">
      <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.5\System.Xml.Linq.dll</HintPath>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="Program.pas" />
    <Content Include="Properties\App.ico" />
    <Compile Include="Properties\AssemblyInfo.pas" />
    <EmbeddedResource Include="Properties\Resources.resx">
      <Generator>ResXFileCodeGenerator</Generator>
    </EmbeddedResource>
    <Compile Include="Properties\Resources.Designer.pas" />
    <None Include="Properties\Settings.settings">
      <Generator>SettingsSingleFileGenerator</Generator>
    </None>
    <Compile Include="Properties\Settings.Designer.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.targets" />
</Project>