<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <RootNamespace>RemObjects.Elements.StandardAspects.DependencyInjection</RootNamespace>
        <OutputType>Library</OutputType>
        <AssemblyName>RemObjects.Elements.StandardAspects.DependencyInjection</AssemblyName>
        <AllowGlobals>False</AllowGlobals>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>False</AllowLegacyCreate>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
        <ProjectGuid>{F040DD91-4C32-4554-8995-6938B4F34AD6}</ProjectGuid>
        <RunPostBuildEvent>㏡</RunPostBuildEvent>
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
        <Reference Include="StructureMap">
            <HintPath>..\lib\StructureMap.dll</HintPath>
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
        <Compile Include="Properties\AssemblyInfo.pas"/>
        <EmbeddedResource Include="Properties\Resources.resx">
            <Generator>ResXFileCodeGenerator</Generator>
        </EmbeddedResource>
        <Compile Include="Properties\Resources.Designer.pas"/>
        <None Include="Properties\Settings.settings">
            <Generator>SettingsSingleFileGenerator</Generator>
        </None>
        <Compile Include="Properties\Settings.Designer.pas"/>
        <Compile Include="PropertyInjector.pas"/>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets"/>
</Project>