<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <RootNamespace>Prism.StandardAspects.Validation</RootNamespace>
    <OutputType>Library</OutputType>
    <AssemblyName>Prism.StandardAspects.Validation</AssemblyName>
    <AllowGlobals>false</AllowGlobals>
    <AllowLegacyOutParams>False</AllowLegacyOutParams>
    <AllowLegacyCreate>false</AllowLegacyCreate>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
    <ProjectGuid>{F806783B-51DF-472E-8C66-22E67E494CAC}</ProjectGuid>
    <RunPostBuildEvent>OnBuildSuccess</RunPostBuildEvent>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <SchemaVersion>2.0</SchemaVersion>
    <DelphiDivide>false</DelphiDivide>
    <DelphiCompatibility>false</DelphiCompatibility>
    <DefaultNamespace />
    <DefaultClassName />
    <AssemblyFileVersion />
    <Name />
    <ProjectType>Library</ProjectType>
    <ProjectID />
    <OwnerKey />
    <AllowLegacyWith>false</AllowLegacyWith>
    <NoRequireOutParam>true</NoRequireOutParam>
    <UnsafeCode>false</UnsafeCode>
    <AllowInlineVars>false</AllowInlineVars>
    <InternalAssemblyName />
    <DefaultUses />
    <ApplicationIcon />
    <SCCProjectName />
    <SCCAuxPath />
    <SCCLocalPath />
    <SCCProvider />
    <ServerPath />
    <StartPage />
    <EnableDefaultClasses>false</EnableDefaultClasses>
    <ProjectTypeGuids />
    <AssemblyKeyName />
    <AssemblyDelaySign>false</AssemblyDelaySign>
    <ManifestKeyFile />
    <ManifestCertificateThumbprint />
    <TargetFramework>196613</TargetFramework>
    <Company />
    <StartupClass />
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
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <DebugType>none</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>bin\Debug</OutputPath>
    <TreatWarningsAsErrors>false</TreatWarningsAsErrors>
    <SuppressWarnings />
    <WebDebugTarget>Cassini</WebDebugTarget>
    <EnableUnmanagedDebugging>false</EnableUnmanagedDebugging>
    <DebugMethodName />
    <DebugClass />
    <XmlDocWarning>WarningOnPublicMembers</XmlDocWarning>
    <UseXmlDoc>false</UseXmlDoc>
    <RunCodeAnalysis>false</RunCodeAnalysis>
    <WarnOnCaseMismatch>false</WarnOnCaseMismatch>
    <RemoteDebugEnabled>false</RemoteDebugEnabled>
    <RemoteDebugMachine />
    <XmlAllMembers>false</XmlAllMembers>
    <WebLaunchBrowser>false</WebLaunchBrowser>
    <CodeFlowAnalysis>true</CodeFlowAnalysis>
    <RequireExplicitLocalInitialization>false</RequireExplicitLocalInitialization>
    <RuntimeVersion>v25</RuntimeVersion>
    <FutureHelperClassName />
    <GeneratePDB>true</GeneratePDB>
    <GenerateMDB>true</GenerateMDB>
    <FrameworkFolder />
    <Name>Prism.StandardAspects.Validation</Name>
    <ConditionalDefines />
    <EnableAssert>true</EnableAssert>
    <WorkingDir />
    <RegisterComInterop>false</RegisterComInterop>
    <CpuType>anycpu</CpuType>
    <StartAppParams />
    <CaptureConsoleOutput>false</CaptureConsoleOutput>
    <StartMode>Project</StartMode>
    <StartApplication />
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <DebugType>none</DebugType>
    <Optimize>true</Optimize>
    <OutputPath>bin\Release</OutputPath>
    <TreatWarningsAsErrors>false</TreatWarningsAsErrors>
    <EnableUnmanagedDebugging>false</EnableUnmanagedDebugging>
    <SuppressWarnings />
    <XmlDocWarning>WarningOnPublicMembers</XmlDocWarning>
    <DebugClass />
    <RuntimeVersion>v25</RuntimeVersion>
    <UseXmlDoc>false</UseXmlDoc>
    <DebugMethodName />
    <WebDebugTarget>Cassini</WebDebugTarget>
    <RunCodeAnalysis>false</RunCodeAnalysis>
    <WarnOnCaseMismatch>false</WarnOnCaseMismatch>
    <RemoteDebugEnabled>false</RemoteDebugEnabled>
    <RemoteDebugMachine />
    <XmlAllMembers>false</XmlAllMembers>
    <WebLaunchBrowser>false</WebLaunchBrowser>
    <CodeFlowAnalysis>true</CodeFlowAnalysis>
    <RequireExplicitLocalInitialization>false</RequireExplicitLocalInitialization>
    <FutureHelperClassName />
    <FrameworkFolder />
    <GenerateMDB>false</GenerateMDB>
    <GeneratePDB>false</GeneratePDB>
    <ConditionalDefines />
    <Name />
    <WorkingDir />
    <StartAppParams />
    <CpuType>anycpu</CpuType>
    <RegisterComInterop>false</RegisterComInterop>
    <CaptureConsoleOutput>false</CaptureConsoleOutput>
    <EnableAssert>true</EnableAssert>
    <StartApplication />
    <StartMode>Project</StartMode>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="mscorlib" />
    <Reference Include="System" />
    <Reference Include="System.Core">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data" />
    <Reference Include="System.Data.DataSetExtensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Drawing" />
    <Reference Include="System.Windows.Forms" />
    <Reference Include="System.Xml" />
    <Reference Include="System.Xml.Linq">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Compile Include="Properties\AssemblyInfo.pas" />
    <EmbeddedResource Include="Properties\Resources.resx">
      <Generator>ResXFileCodeGenerator</Generator>
    </EmbeddedResource>
    <Compile Include="Properties\Resources.Designer.pas" />
    <None Include="Properties\Settings.settings">
      <Generator>SettingsSingleFileGenerator</Generator>
    </None>
    <Compile Include="Properties\Settings.Designer.pas" />
    <Compile Include="RuleViolation.pas" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
  </ItemGroup>
  <PropertyGroup>
  </PropertyGroup>
  <PropertyGroup>
  </PropertyGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.targets" />
  <PropertyGroup>
    <PreBuildEvent />
    <PostBuildEvent />
  </PropertyGroup>
</Project>