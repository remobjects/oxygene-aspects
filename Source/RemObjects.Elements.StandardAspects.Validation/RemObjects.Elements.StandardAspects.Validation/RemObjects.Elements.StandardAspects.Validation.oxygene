<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <ProductVersion>3.5</ProductVersion>
        <RootNamespace>RemObjects.Elements.StandardAspects.Validation</RootNamespace>
        <OutputType>Library</OutputType>
        <AssemblyName>RemObjects.Elements.StandardAspects.Validation</AssemblyName>
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
        <ProjectType>Library</ProjectType>
        <AllowLegacyWith>false</AllowLegacyWith>
        <NoRequireOutParam>true</NoRequireOutParam>
        <UnsafeCode>false</UnsafeCode>
        <AllowInlineVars>false</AllowInlineVars>
        <EnableDefaultClasses>false</EnableDefaultClasses>
        <AssemblyDelaySign>false</AssemblyDelaySign>
        <TargetFramework>196613</TargetFramework>
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
        <WebDebugTarget>Cassini</WebDebugTarget>
        <EnableUnmanagedDebugging>false</EnableUnmanagedDebugging>
        <XmlDocWarning>WarningOnPublicMembers</XmlDocWarning>
        <UseXmlDoc>false</UseXmlDoc>
        <RunCodeAnalysis>false</RunCodeAnalysis>
        <WarnOnCaseMismatch>false</WarnOnCaseMismatch>
        <RemoteDebugEnabled>false</RemoteDebugEnabled>
        <XmlAllMembers>false</XmlAllMembers>
        <WebLaunchBrowser>false</WebLaunchBrowser>
        <CodeFlowAnalysis>true</CodeFlowAnalysis>
        <RequireExplicitLocalInitialization>false</RequireExplicitLocalInitialization>
        <RuntimeVersion>v25</RuntimeVersion>
        <GeneratePDB>true</GeneratePDB>
        <GenerateMDB>true</GenerateMDB>
        <Name>RemObjects.Elements.StandardAspects.Validation</Name>
        <EnableAssert>true</EnableAssert>
        <RegisterComInterop>false</RegisterComInterop>
        <CpuType>anycpu</CpuType>
        <CaptureConsoleOutput>false</CaptureConsoleOutput>
        <StartMode>Project</StartMode>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
        <DebugType>none</DebugType>
        <Optimize>true</Optimize>
        <OutputPath>bin\Release</OutputPath>
        <TreatWarningsAsErrors>false</TreatWarningsAsErrors>
        <EnableUnmanagedDebugging>false</EnableUnmanagedDebugging>
        <XmlDocWarning>WarningOnPublicMembers</XmlDocWarning>
        <RuntimeVersion>v25</RuntimeVersion>
        <UseXmlDoc>false</UseXmlDoc>
        <WebDebugTarget>Cassini</WebDebugTarget>
        <RunCodeAnalysis>false</RunCodeAnalysis>
        <WarnOnCaseMismatch>false</WarnOnCaseMismatch>
        <RemoteDebugEnabled>false</RemoteDebugEnabled>
        <XmlAllMembers>false</XmlAllMembers>
        <WebLaunchBrowser>false</WebLaunchBrowser>
        <CodeFlowAnalysis>true</CodeFlowAnalysis>
        <RequireExplicitLocalInitialization>false</RequireExplicitLocalInitialization>
        <GenerateMDB>false</GenerateMDB>
        <GeneratePDB>false</GeneratePDB>
        <CpuType>anycpu</CpuType>
        <RegisterComInterop>false</RegisterComInterop>
        <CaptureConsoleOutput>false</CaptureConsoleOutput>
        <EnableAssert>true</EnableAssert>
        <StartMode>Project</StartMode>
    </PropertyGroup>
    <ItemGroup>
        <Reference Include="mscorlib"/>
        <Reference Include="System"/>
        <Reference Include="System.Core">
            <RequiredTargetFramework>3.5</RequiredTargetFramework>
        </Reference>
        <Reference Include="System.Data"/>
        <Reference Include="System.Data.DataSetExtensions">
            <RequiredTargetFramework>3.5</RequiredTargetFramework>
        </Reference>
        <Reference Include="System.Drawing"/>
        <Reference Include="System.Windows.Forms"/>
        <Reference Include="System.Xml"/>
        <Reference Include="System.Xml.Linq">
            <RequiredTargetFramework>3.5</RequiredTargetFramework>
        </Reference>
    </ItemGroup>
    <ItemGroup>
        <Compile Include="Properties\AssemblyInfo.pas"/>
        <EmbeddedResource Include="Properties\Resources.resx">
            <Generator>ResXFileCodeGenerator</Generator>
        </EmbeddedResource>
        <Compile Include="Properties\Resources.Designer.pas"/>
        <None Include="Properties\Settings.settings">
            <Generator>SettingsSingleFileGenerator</Generator>
        </None>
        <Compile Include="Properties\Settings.Designer.pas"/>
        <Compile Include="RuleViolation.pas"/>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <PropertyGroup/>
    <PropertyGroup/>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets"/>
    <PropertyGroup>
        <PreBuildEvent/>
        <PostBuildEvent/>
    </PropertyGroup>
</Project>