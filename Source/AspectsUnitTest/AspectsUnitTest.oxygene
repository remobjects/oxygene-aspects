<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <RootNamespace>AspectsUnitTest</RootNamespace>
        <OutputType>Library</OutputType>
        <AssemblyName>AspectsUnitTest</AssemblyName>
        <AllowGlobals>False</AllowGlobals>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>False</AllowLegacyCreate>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
        <ProjectGuid>{1B29A181-3324-4D63-9D24-EC891CEE42C3}</ProjectGuid>
        <RunPostBuildEvent>㏡</RunPostBuildEvent>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
        <DefineConstants>DEBUG;TRACE;</DefineConstants>
        <OutputPath>.\bin\Debug</OutputPath>
        <GeneratePDB>True</GeneratePDB>
        <GenerateMDB>True</GenerateMDB>
        <EnableUnmanagedDebugging>False</EnableUnmanagedDebugging>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
        <OutputPath>.\bin\Release</OutputPath>
        <EnableAsserts>False</EnableAsserts>
    </PropertyGroup>
    <ItemGroup>
        <Reference Include="mscorlib">
            <HintPath>mscorlib.dll</HintPath>
        </Reference>
        <Reference Include="nunit.framework">
            <HintPath>..\lib\nunit.framework.dll</HintPath>
            <Name>nunit.framework.dll</Name>
            <Private>True</Private>
        </Reference>
        <ProjectReference Include="..\RemObjects.Elements.StandardAspects\RemObjects.Elements.StandardAspects.oxygene">
            <Project>{FDFA9E51-2441-4785-9599-44A17D1B72C7}</Project>
            <HintPath>$(Project)\..\RemObjects.Elements.StandardAspects\bin\Debug\RemObjects.Elements.StandardAspects.dll</HintPath>
            <Name>RemObjects.Elements.StandardAspects</Name>
        </ProjectReference>
        <Reference Include="RemObjects.Oxygene.Cirrus">
            <HintPath>$(ProgramFiles)\CodeGear\Delphi RemObjects.Elements\Bin\RemObjects.Oxygene.Cirrus.dll</HintPath>
            <Name>RemObjects.Oxygene.Cirrus.dll</Name>
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
        <Reference Include="System.Windows.Forms">
            <HintPath>C:\Windows\Microsoft.NET\Framework\v2.0.50727\System.Windows.Forms.dll</HintPath>
        </Reference>
        <Reference Include="System.Xml">
            <HintPath>System.Xml.dll</HintPath>
        </Reference>
        <Reference Include="System.Xml.Linq">
            <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.5\System.Xml.Linq.dll</HintPath>
        </Reference>
    </ItemGroup>
    <ItemGroup>
        <Compile Include="CloneableAspectTest.pas"/>
        <Compile Include="EqualsAspectTest.pas"/>
        <Compile Include="InvokeRequiredAspectTest.pas"/>
        <Compile Include="Properties\AssemblyInfo.pas"/>
        <EmbeddedResource Include="Properties\Resources.resx">
            <Generator>ResXFileCodeGenerator</Generator>
        </EmbeddedResource>
        <Compile Include="Properties\Resources.Designer.pas"/>
        <None Include="Properties\Settings.settings">
            <Generator>SettingsSingleFileGenerator</Generator>
        </None>
        <Compile Include="Properties\Settings.Designer.pas"/>
        <Compile Include="SingletonAspectTest.pas"/>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets"/>
    <PropertyGroup>
        <PreBuildEvent/>
    </PropertyGroup>
</Project>
