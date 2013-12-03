<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <ProductVersion>3.5</ProductVersion>
        <RootNamespace>ValidationDomain.Tests</RootNamespace>
        <OutputType>library</OutputType>
        <AssemblyName>ValidationDomain.Tests</AssemblyName>
        <AllowGlobals>False</AllowGlobals>
        <AllowLegacyWith>False</AllowLegacyWith>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>False</AllowLegacyCreate>
        <AllowUnsafeCode>False</AllowUnsafeCode>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
        <Name>ValidationDomain.Tests</Name>
        <ProjectGuid>{daad5eec-dde8-44f2-8bde-96443020e5fb}</ProjectGuid>
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
        <Reference Include="mscorlib"/>
        <Reference Include="nunit.framework">
            <HintPath>..\lib\bin\nunit.framework.dll</HintPath>
            <Private>True</Private>
        </Reference>
        <Reference Include="RemObjects.Oxygene.Cirrus">
            <HintPath>C:\Program Files\CodeGear\Delphi RemObjects.Elements\Reference Assemblies\RemObjects.Oxygene.Cirrus.dll</HintPath>
        </Reference>
        <Reference Include="System"/>
        <Reference Include="System.Data"/>
        <Reference Include="System.Drawing"/>
        <Reference Include="System.Windows.Forms"/>
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
        <ProjectReference Include="..\..\RemObjects.Elements.StandardAspects.ValidationAspects\RemObjects.Elements.StandardAspects.ValidationAspects.oxygene">
            <Name>RemObjects.Elements.StandardAspects.ValidationAspects</Name>
            <Project>{48ff9846-2900-4156-af0e-1cadea6f2a15}</Project>
            <Private>True</Private>
            <IsCirrusRef>True</IsCirrusRef>
        </ProjectReference>
        <ProjectReference Include="..\..\RemObjects.Elements.StandardAspects.Validation\RemObjects.Elements.StandardAspects.Validation.oxygene">
            <Name>RemObjects.Elements.StandardAspects.Validation</Name>
            <Project>{f806783b-51df-472e-8c66-22e67e494cac}</Project>
            <Private>True</Private>
            <HintPath>..\..\RemObjects.Elements.StandardAspects.Validation\bin\Debug\RemObjects.Elements.StandardAspects.Validation.dll</HintPath>
        </ProjectReference>
    </ItemGroup>
    <ItemGroup>
        <Compile Include="DateTimeHasValueTests.pas"/>
        <Compile Include="GetterTests.pas"/>
        <Compile Include="NumericBetweenValuesTest.pas"/>
        <Compile Include="NumericHasValueTests.pas"/>
        <Compile Include="Properties\AssemblyInfo.pas"/>
        <EmbeddedResource Include="Properties\Resources.resx">
            <Generator>ResXFileCodeGenerator</Generator>
        </EmbeddedResource>
        <Compile Include="Properties\Resources.Designer.pas"/>
        <None Include="Properties\Settings.settings">
            <Generator>SettingsSingleFileGenerator</Generator>
        </None>
        <Compile Include="Properties\Settings.Designer.pas"/>
        <Compile Include="StringHasLengthTests.pas"/>
        <Compile Include="StringNullOrEmptyTests.pas"/>
        <Compile Include="ValidationMethodForPropertyTests.pas"/>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <PropertyGroup/>
    <PropertyGroup/>
    <PropertyGroup/>
    <PropertyGroup/>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets"/>
    <PropertyGroup>
        <PreBuildEvent/>
        <PostBuildEvent/>
    </PropertyGroup>
</Project>