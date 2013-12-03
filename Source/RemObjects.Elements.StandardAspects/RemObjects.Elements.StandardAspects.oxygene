<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <RootNamespace>RemObjects.Elements.StandardAspects</RootNamespace>
        <OutputType>Library</OutputType>
        <AssemblyName>RemObjects.Elements.StandardAspects</AssemblyName>
        <AllowGlobals>False</AllowGlobals>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>False</AllowLegacyCreate>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
        <ProjectGuid>{FDFA9E51-2441-4785-9599-44A17D1B72C7}</ProjectGuid>
        <RunPostBuildEvent>㏔</RunPostBuildEvent>
        <AllowLegacyWith>False</AllowLegacyWith>
        <AllowUnsafeCode>False</AllowUnsafeCode>
        <DelphiCompatibility>False</DelphiCompatibility>
        <DelphiDivide>False</DelphiDivide>
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
    <PropertyGroup Condition=" '$(Configuration)' == 'Debug without initial Prime' ">
        <DefineConstants>DEBUG;TRACE;</DefineConstants>
        <GeneratePDB>True</GeneratePDB>
        <GenerateMDB>True</GenerateMDB>
        <OutputPath>bin\Debug without initial Prime\</OutputPath>
    </PropertyGroup>
    <ItemGroup>
        <Reference Include="mscorlib"/>
        <Reference Include="RemObjects.Oxygene.Cirrus">
            <Name>RemObjects.Oxygene.Cirrus.dll</Name>
            <Private>False</Private>
            <HintPath>RemObjects.Oxygene.Cirrus.dll</HintPath>
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
        <Reference Include="System.Drawing">
            <HintPath>System.Drawing.dll</HintPath>
        </Reference>
        <Reference Include="System.Windows.Forms">
            <HintPath>System.Windows.Forms.dll</HintPath>
        </Reference>
        <Reference Include="System.Xml">
            <HintPath>System.Xml.dll</HintPath>
        </Reference>
        <Reference Include="System.Xml.Linq">
            <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.5\System.Xml.Linq.dll</HintPath>
        </Reference>
        <Reference Include="WindowsBase">
            <HintPath>C:\Program Files (x86)\Reference Assemblies\Microsoft\Framework\v3.0\WindowsBase.dll</HintPath>
        </Reference>
    </ItemGroup>
    <ItemGroup>
        <Compile Include="CheckDisposedAttribute.pas"/>
        <Compile Include="CloneableAttribute.pas"/>
        <Compile Include="DisposableAttribute.pas"/>
        <Compile Include="EqualsAttribute.pas"/>
        <Compile Include="InvokeRequiredAttribute.pas"/>
        <Compile Include="NotifyPropertyChangedAttribute.pas"/>
        <Compile Include="Properties\AssemblyInfo.pas"/>
        <EmbeddedResource Include="Properties\Resources.resx">
            <Generator>ResXFileCodeGenerator</Generator>
        </EmbeddedResource>
        <Compile Include="Properties\Resources.Designer.pas"/>
        <None Include="Properties\Settings.settings">
            <Generator>SettingsSingleFileGenerator</Generator>
        </None>
        <Compile Include="Properties\Settings.Designer.pas"/>
        <Compile Include="SingletonAttribute.pas"/>
        <Compile Include="WPFInvokeRequiredAttribute.pas"/>
        <Compile Include="WriteCachedPropertyAttribute.pas"/>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets"/>
    <PropertyGroup>
        <PreBuildEvent/>
    </PropertyGroup>
</Project>