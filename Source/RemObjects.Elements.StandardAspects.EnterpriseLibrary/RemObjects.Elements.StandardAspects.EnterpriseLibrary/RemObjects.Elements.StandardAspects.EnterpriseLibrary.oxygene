<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <ProductVersion>3.5</ProductVersion>
        <RootNamespace>RemObjects.Elements.StandardAspects.EnterpriseLibrary</RootNamespace>
        <OutputType>Library</OutputType>
        <AssemblyName>RemObjects.Elements.StandardAspects.EnterpriseLibrary</AssemblyName>
        <AllowGlobals>False</AllowGlobals>
        <AllowLegacyWith>False</AllowLegacyWith>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>False</AllowLegacyCreate>
        <AllowUnsafeCode>False</AllowUnsafeCode>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
        <Name>RemObjects.Elements.StandardAspects.EnterpriseLibrary</Name>
        <ProjectGuid>{5d070e1f-7122-4926-a3b8-20d87f918677}</ProjectGuid>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
        <Optimize>false</Optimize>
        <OutputPath>.\bin\Debug</OutputPath>
        <DefineConstants>DEBUG;TRACE;</DefineConstants>
        <GeneratePDB>True</GeneratePDB>
        <GenerateMDB>True</GenerateMDB>
        <EnableAsserts>True</EnableAsserts>
        <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
        <CaptureConsoleOutput>False</CaptureConsoleOutput>
        <StartMode>Project</StartMode>
        <RegisterForComInterop>False</RegisterForComInterop>
        <CpuType>anycpu</CpuType>
        <RuntimeVersion>v25</RuntimeVersion>
        <XmlDoc>False</XmlDoc>
        <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
        <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
        <Optimize>true</Optimize>
        <OutputPath>.\bin\Release</OutputPath>
        <GeneratePDB>False</GeneratePDB>
        <GenerateMDB>False</GenerateMDB>
        <EnableAsserts>False</EnableAsserts>
        <TreatWarningsAsErrors>False</TreatWarningsAsErrors>
        <CaptureConsoleOutput>False</CaptureConsoleOutput>
        <StartMode>Project</StartMode>
        <RegisterForComInterop>False</RegisterForComInterop>
        <CpuType>anycpu</CpuType>
        <RuntimeVersion>v25</RuntimeVersion>
        <XmlDoc>False</XmlDoc>
        <XmlDocWarningLevel>WarningOnPublicMembers</XmlDocWarningLevel>
        <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
    </PropertyGroup>
    <ItemGroup>
        <Reference Include="Microsoft.Practices.EnterpriseLibrary.Common">
            <HintPath>C:\develop\Moshine\Moshine.EnterpriseLibrary\lib\bin\Microsoft.Practices.EnterpriseLibrary.Common.dll</HintPath>
        </Reference>
        <Reference Include="Microsoft.Practices.EnterpriseLibrary.ExceptionHandling">
            <HintPath>C:\develop\Moshine\Moshine.EnterpriseLibrary\lib\bin\Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.dll</HintPath>
        </Reference>
        <Reference Include="Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.Logging">
            <HintPath>C:\develop\Moshine\Moshine.EnterpriseLibrary\lib\bin\Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.Logging.dll</HintPath>
        </Reference>
        <Reference Include="Microsoft.Practices.EnterpriseLibrary.Logging">
            <HintPath>C:\develop\Moshine\Moshine.EnterpriseLibrary\lib\bin\Microsoft.Practices.EnterpriseLibrary.Logging.dll</HintPath>
        </Reference>
        <Reference Include="Microsoft.Practices.ServiceLocation">
            <HintPath>C:\develop\Moshine\Moshine.EnterpriseLibrary\lib\bin\Microsoft.Practices.ServiceLocation.dll</HintPath>
        </Reference>
        <Reference Include="Microsoft.Practices.Unity">
            <HintPath>C:\develop\Moshine\Moshine.EnterpriseLibrary\lib\bin\Microsoft.Practices.Unity.dll</HintPath>
        </Reference>
        <Reference Include="Microsoft.Practices.Unity.Interception">
            <HintPath>C:\develop\Moshine\Moshine.EnterpriseLibrary\lib\bin\Microsoft.Practices.Unity.Interception.dll</HintPath>
        </Reference>
        <Reference Include="mscorlib"/>
        <Reference Include="System"/>
        <Reference Include="System.Data"/>
        <Reference Include="System.Web">
            <HintPath>C:\Windows\Microsoft.NET\Framework\v2.0.50727\System.Web.dll</HintPath>
        </Reference>
        <Reference Include="System.Xml"/>
        <Reference Include="System.Core">
            <RequiredTargetFramework>3.5</RequiredTargetFramework>
        </Reference>
        <Reference Include="System.Xml.Linq">
            <RequiredTargetFramework>3.5</RequiredTargetFramework>
        </Reference>
        <Reference Include="System.Data.DataSetExtensions">
            <RequiredTargetFramework>3.5</RequiredTargetFramework>
        </Reference>
    </ItemGroup>
    <ItemGroup>
        <Compile Include="HttpApplicationExtensions.pas"/>
        <Compile Include="Properties\AssemblyInfo.pas"/>
        <EmbeddedResource Include="Properties\Resources.resx">
            <Generator>ResXFileCodeGenerator</Generator>
        </EmbeddedResource>
        <Compile Include="Properties\Resources.Designer.pas"/>
        <None Include="Properties\Settings.settings">
            <Generator>SettingsSingleFileGenerator</Generator>
        </None>
        <Compile Include="Properties\Settings.Designer.pas"/>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets"/>
</Project>