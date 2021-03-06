<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <ProductVersion>3.5</ProductVersion>
        <DefaultNamespace>IDataErrorInfoWindowsApplication</DefaultNamespace>
        <OutputType>winexe</OutputType>
        <AssemblyName>IDataErrorInfoWindowsApplication</AssemblyName>
        <AllowGlobals>False</AllowGlobals>
        <AllowLegacyWith>False</AllowLegacyWith>
        <AllowLegacyOutParams>False</AllowLegacyOutParams>
        <AllowLegacyCreate>False</AllowLegacyCreate>
        <AllowUnsafeCode>False</AllowUnsafeCode>
        <ApplicationIcon>Properties\App.ico</ApplicationIcon>
        <ProjectTypeGuids>{89896941-7261-4476-8385-4DA3CE9FDB83};{60dc8134-eba5-43b8-bcc9-bb4bc16c2548};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
        <Name>IDataErrorInfoWindowsApplication</Name>
        <RootNamespace>IDataErrorInfoWindowsApplication</RootNamespace>
        <ProjectGuid>{4ecfb929-b18a-4bc5-857d-fc1d0ca63bcf}</ProjectGuid>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
        <Conditionals>DEBUG;TRACE</Conditionals>
        <OutputPath>.\bin\Debug\</OutputPath>
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
        <Reference Include="PresentationCore"/>
        <Reference Include="PresentationFramework"/>
        <Reference Include="ReachFramework"/>
        <Reference Include="System"/>
        <Reference Include="System.Data"/>
        <Reference Include="System.Drawing"/>
        <Reference Include="System.Windows.Forms"/>
        <Reference Include="System.Xml"/>
        <Reference Include="UIAutomationProvider"/>
        <Reference Include="UIAutomationTypes"/>
        <Reference Include="WindowsBase"/>
        <Reference Include="System.Core">
            <RequiredTargetFramework>3.5</RequiredTargetFramework>
        </Reference>
        <Reference Include="System.Xml.Linq">
            <RequiredTargetFramework>3.5</RequiredTargetFramework>
        </Reference>
        <Reference Include="System.Data.DataSetExtensions">
            <RequiredTargetFramework>3.5</RequiredTargetFramework>
        </Reference>
        <Reference Include="WPFToolkit"/>
        <ProjectReference Include="..\..\RemObjects.Elements.StandardAspects.Validation\RemObjects.Elements.StandardAspects.Validation.oxygene">
            <Name>RemObjects.Elements.StandardAspects.Validation</Name>
            <Project>{f806783b-51df-472e-8c66-22e67e494cac}</Project>
            <Private>True</Private>
            <HintPath>..\..\RemObjects.Elements.StandardAspects.Validation\bin\Debug\RemObjects.Elements.StandardAspects.Validation.dll</HintPath>
        </ProjectReference>
        <ProjectReference Include="..\ValidationDomain\ValidationDomain.oxygene">
            <Name>ValidationDomain</Name>
            <Project>{60f1dcf6-2883-490f-9b0c-b1b57f8b895d}</Project>
            <Private>True</Private>
        </ProjectReference>
    </ItemGroup>
    <ItemGroup>
        <ApplicationDefinition Include="App.xaml"/>
        <Compile Include="App.xaml.pas"/>
        <Compile Include="Window2.xaml.pas">
            <DependentUpon>Window2.xaml</DependentUpon>
        </Compile>
        <Page Include="Window1.xaml">
            <Generator>MSBuild:Compile</Generator>
        </Page>
        <Compile Include="Window1.xaml.pas"/>
        <None Include="Properties\App.ico"/>
        <Compile Include="Properties\AssemblyInfo.pas"/>
        <Compile Include="Properties\Resources.Designer.pas"/>
        <EmbeddedResource Include="Properties\Resources.resx">
            <Generator>ResXFileCodeGenerator</Generator>
        </EmbeddedResource>
        <Compile Include="Properties\Settings.Designer.pas"/>
        <None Include="Properties\Settings.settings">
            <Generator>SettingsSingleFileGenerator</Generator>
        </None>
        <Page Include="Window2.xaml">
            <Generator>MSBuild:Compile</Generator>
        </Page>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets"/>
</Project>