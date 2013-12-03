<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0" DefaultTargets="Build">
    <PropertyGroup>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
        <ProjectGuid>{21f00f20-31b7-4e87-a80a-864bcb5ec6f2}</ProjectGuid>
        <ProjectTypeGuids>{A1591282-1198-4647-A2B1-27E5FF5F6F3B};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
        <OutputType>library</OutputType>
        <RootNamespace>RemObjects.Elements.StandardAspects.Silverlight</RootNamespace>
        <AssemblyName>Validation.Silverlight</AssemblyName>
        <TargetFrameworkIdentifier>Silverlight</TargetFrameworkIdentifier>
        <TargetFrameworkVersion>v4.0</TargetFrameworkVersion>
        <SilverlightVersion>$(TargetFrameworkVersion)</SilverlightVersion>
        <SilverlightApplication>false</SilverlightApplication>
        <ValidateXaml>true</ValidateXaml>
        <ThrowErrorsInValidation>true</ThrowErrorsInValidation>
        <AllowGlobals>False</AllowGlobals>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>False</AllowLegacyCreate>
        <Name>RemObjects.Elements.StandardAspects.Validation.Silverlight</Name>
    </PropertyGroup>
    <!-- This property group is only here to support building this project using the 
       MSBuild 3.5 toolset. In order to work correctly with this older toolset, it needs 
       to set the TargetFrameworkVersion to v3.5 -->
    <PropertyGroup Condition="'$(MSBuildToolsVersion)' == '3.5'">
        <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
        <DefineConstants>DEBUG;TRACE;SILVERLIGHT</DefineConstants>
        <OutputPath>Bin\Debug</OutputPath>
        <GeneratePDB>True</GeneratePDB>
        <Optimize>false</Optimize>
        <GenerateMDB>True</GenerateMDB>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
        <DefineConstants>SILVERLIGHT</DefineConstants>
        <Optimize>true</Optimize>
        <OutputPath>Bin\Release</OutputPath>
        <EnableAsserts>False</EnableAsserts>
    </PropertyGroup>
    <ItemGroup>
        <Reference Include="mscorlib"/>
        <Reference Include="System.Windows"/>
        <Reference Include="System"/>
        <Reference Include="System.Core"/>
        <Reference Include="System.Xml"/>
        <Reference Include="System.Net"/>
        <Reference Include="System.Windows.Browser"/>
    </ItemGroup>
    <ItemGroup>
        <Compile Include="C:\develop\Moshine\Validation\Validation\RuleViolation.pas"/>
        <Compile Include="Properties\AssemblyInfo.pas"/>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.Silverlight.targets"/>
    <ProjectExtensions/>
</Project>