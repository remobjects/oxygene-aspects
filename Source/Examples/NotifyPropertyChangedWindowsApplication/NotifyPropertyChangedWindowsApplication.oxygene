<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <ProjectGuid>{3C88FA53-9025-4640-AEF1-AFAD3C723087}</ProjectGuid>
        <RootNamespace>NotifyPropertyChangedWindowsApplication</RootNamespace>
        <OutputType>WinExe</OutputType>
        <AssemblyName>NotifyPropertyChangedWindowsApplication</AssemblyName>
        <AllowGlobals>False</AllowGlobals>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>False</AllowLegacyCreate>
        <ApplicationIcon>Properties\App.ico</ApplicationIcon>
        <ProjectTypeGuids>{89896941-7261-4476-8385-4DA3CE9FDB83};{60dc8134-eba5-43b8-bcc9-bb4bc16c2548};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
        <RunPostBuildEvent>㏡</RunPostBuildEvent>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
        <DefineConstants>DEBUG;TRACE</DefineConstants>
        <OutputPath>.\bin\Debug\</OutputPath>
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
        <Reference Include="PresentationCore">
            <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.0\PresentationCore.dll</HintPath>
        </Reference>
        <Reference Include="PresentationFramework">
            <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.0\PresentationFramework.dll</HintPath>
        </Reference>
        <ProjectReference Include="..\..\RemObjects.Elements.StandardAspects\RemObjects.Elements.StandardAspects.oxygene">
            <Project>{FDFA9E51-2441-4785-9599-44A17D1B72C7}</Project>
            <HintPath>$(Project)\..\..\RemObjects.Elements.StandardAspects\bin\Debug\RemObjects.Elements.StandardAspects.dll</HintPath>
            <Name>RemObjects.Elements.StandardAspects</Name>
        </ProjectReference>
        <Reference Include="ReachFramework">
            <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.0\ReachFramework.dll</HintPath>
        </Reference>
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
        <Reference Include="UIAutomationProvider">
            <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.0\UIAutomationProvider.dll</HintPath>
        </Reference>
        <Reference Include="UIAutomationTypes">
            <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.0\UIAutomationTypes.dll</HintPath>
        </Reference>
        <Reference Include="WindowsBase">
            <HintPath>$(ProgramFiles)\Reference Assemblies\Microsoft\Framework\v3.0\WindowsBase.dll</HintPath>
        </Reference>
    </ItemGroup>
    <ItemGroup>
        <ApplicationDefinition Include="App.xaml"/>
        <Compile Include="App.xaml.pas"/>
        <Compile Include="Domain\Employee.pas"/>
        <None Include="Properties\App.ico"/>
        <Compile Include="Properties\AssemblyInfo.pas"/>
        <EmbeddedResource Include="Properties\Resources.resx">
            <Generator>ResXFileCodeGenerator</Generator>
        </EmbeddedResource>
        <Compile Include="Properties\Resources.Designer.pas"/>
        <None Include="Properties\Settings.settings">
            <Generator>SettingsSingleFileGenerator</Generator>
        </None>
        <Compile Include="Properties\Settings.Designer.pas"/>
        <Page Include="Window1.xaml">
            <Generator>MSBuild:Compile</Generator>
        </Page>
        <Compile Include="Window1.xaml.pas"/>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Domain\"/>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets"/>
</Project>