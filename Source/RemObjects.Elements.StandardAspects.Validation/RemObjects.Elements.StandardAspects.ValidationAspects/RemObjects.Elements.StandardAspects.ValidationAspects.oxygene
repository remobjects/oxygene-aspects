<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <ProductVersion>3.5</ProductVersion>
        <RootNamespace>RemObjects.Elements.StandardAspects.ValidationAspects</RootNamespace>
        <OutputType>Library</OutputType>
        <AssemblyName>RemObjects.Elements.StandardAspects.ValidationAspects</AssemblyName>
        <AllowGlobals>false</AllowGlobals>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>false</AllowLegacyCreate>
        <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
        <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
        <ProjectGuid>{48FF9846-2900-4156-AF0E-1CADEA6F2A15}</ProjectGuid>
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
        <Name>RemObjects.Elements.StandardAspects.ValidationAspects</Name>
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
        <Reference Include="RemObjects.Oxygene.Cirrus, Version=3.0.22.0, Culture=neutral, PublicKeyToken=3df3cad1b7aa5098">
            <SpecificVersion>False</SpecificVersion>
            <HintPath>..\lib\bin\RemObjects.Oxygene.Cirrus.dll</HintPath>
        </Reference>
        <ProjectReference Include="..\RemObjects.Elements.StandardAspects.Validation\RemObjects.Elements.StandardAspects.Validation.oxygene">
            <Name>RemObjects.Elements.StandardAspects.Validation</Name>
            <Project>{f806783b-51df-472e-8c66-22e67e494cac}</Project>
            <Private>True</Private>
            <HintPath>..\RemObjects.Elements.StandardAspects.Validation\bin\Debug\Validation.dll</HintPath>
        </ProjectReference>
    </ItemGroup>
    <ItemGroup>
        <Compile Include="DateTimeHasValue.pas"/>
        <Compile Include="NumericBetweenValues.pas"/>
        <Compile Include="NumericHasValue.pas"/>
        <Compile Include="Properties\AssemblyInfo.pas"/>
        <EmbeddedResource Include="Properties\Resources.resx">
            <Generator>ResXFileCodeGenerator</Generator>
        </EmbeddedResource>
        <Compile Include="Properties\Resources.Designer.pas"/>
        <None Include="Properties\Settings.settings">
            <Generator>SettingsSingleFileGenerator</Generator>
        </None>
        <Compile Include="Properties\Settings.Designer.pas"/>
        <Compile Include="StatementStorage.pas"/>
        <Compile Include="StringHasLength.pas"/>
        <Compile Include="StringNullOrEmpty.pas"/>
        <Compile Include="ValidateBase.pas"/>
        <Compile Include="Validation.pas"/>
        <Compile Include="ValidationMethod.pas"/>
        <Compile Include="ValidationMethodForProperty.pas"/>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <PropertyGroup/>
    <PropertyGroup/>
    <PropertyGroup/>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets"/>
    <PropertyGroup>
        <PreBuildEvent/>
        <PostBuildEvent/>
    </PropertyGroup>
</Project>