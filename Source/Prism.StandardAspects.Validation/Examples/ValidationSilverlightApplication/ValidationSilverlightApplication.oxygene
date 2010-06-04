<?xml version="1.0" encoding="utf-8"?>
<Project ToolsVersion="4.0" DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
  <PropertyGroup>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
    <ProjectGuid>{3d0b4fc3-140e-4ae4-b09c-11abec8db0cf}</ProjectGuid>
    <ProjectTypeGuids>{89896941-7261-4476-8385-4DA3CE9FDB83};{A1591282-1198-4647-A2B1-27E5FF5F6F3B};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <OutputType>library</OutputType>
    <RootNamespace>ValidationSilverlightApplication</RootNamespace>
    <AssemblyName>ValidationSilverlightApplication</AssemblyName>
    <TargetFrameworkIdentifier>Silverlight</TargetFrameworkIdentifier>
    <TargetFrameworkVersion>v4.0</TargetFrameworkVersion>
    <SilverlightVersion>$(TargetFrameworkVersion)</SilverlightVersion>
    <SilverlightApplication>true</SilverlightApplication>
    <SupportedCultures>
    </SupportedCultures>
    <XapOutputs>true</XapOutputs>
    <GenerateSilverlightManifest>true</GenerateSilverlightManifest>
    <XapFilename>ValidationSilverlightApplication.xap</XapFilename>
    <SilverlightManifestTemplate>Properties\AppManifest.xml</SilverlightManifestTemplate>
    <SilverlightAppEntry>ValidationSilverlightApplication.App</SilverlightAppEntry>
    <TestPageFileName>ValidationSilverlightApplicationTestPage.html</TestPageFileName>
    <CreateTestPage>true</CreateTestPage>
    <ValidateXaml>true</ValidateXaml>
    <EnableOutOfBrowser>false</EnableOutOfBrowser>
    <OutOfBrowserSettingsFile>Properties\OutOfBrowserSettings.xml</OutOfBrowserSettingsFile>
    <UsePlatformExtensions>false</UsePlatformExtensions>
    <ThrowErrorsInValidation>true</ThrowErrorsInValidation>
    <LinkedServerProject>
    </LinkedServerProject>
    <AllowGlobals>False</AllowGlobals>
    <AllowLegacyOutParams>False</AllowLegacyOutParams>
    <AllowLegacyCreate>False</AllowLegacyCreate>
    <Name>ValidationSilverlightApplication</Name>
    <Company />
    <TargetFrameworkProfile />
  </PropertyGroup>
  <!-- This property group is only here to support building this project using the 
       MSBuild 3.5 toolset. In order to work correctly with this older toolset, it needs 
       to set the TargetFrameworkVersion to v3.5 -->
  <PropertyGroup Condition="'$(MSBuildToolsVersion)' == '3.5'">
    <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Debug|AnyCPU' ">
    <Optimize>false</Optimize>
    <OutputPath>Bin\Debug</OutputPath>
    <DefineConstants>DEBUG;TRACE;SILVERLIGHT</DefineConstants>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)|$(Platform)' == 'Release|AnyCPU' ">
    <OutputPath>Bin\Release</OutputPath>
    <DefineConstants>SILVERLIGHT</DefineConstants>
    <EnableAsserts>False</EnableAsserts>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="mscorlib" />
    <Reference Include="System.Windows" />
    <Reference Include="System" />
    <Reference Include="System.Core" />
    <Reference Include="System.Net" />
    <Reference Include="System.Runtime.Serialization" />
    <Reference Include="System.Windows.Controls">
      <HintPath>c:\Program Files\Microsoft SDKs\Silverlight\v4.0\Libraries\Client\System.Windows.Controls.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Windows.Controls.Data">
      <HintPath>c:\Program Files\Microsoft SDKs\Silverlight\v4.0\Libraries\Client\System.Windows.Controls.Data.dll</HintPath>
      <Private>True</Private>
    </Reference>
    <Reference Include="System.Windows.Controls.Navigation" />
    <Reference Include="System.Xml" />
    <Reference Include="System.Windows.Browser" />
  </ItemGroup>
  <ItemGroup>
    <Compile Include="App.xaml.pas" />
    <Page Include="Page.xaml">
      <Generator>MSBuild:MarkupCompilePass1</Generator>
    </Page>
    <Compile Include="Page.xaml.pas" />
    <Compile Include="Page1.xaml.pas">
      <DependentUpon>Page1.xaml</DependentUpon>
    </Compile>
    <Compile Include="Properties\AssemblyInfo.pas" />
    <ApplicationDefinition Include="App.xaml">
      <Generator>MSBuild:Compile</Generator>
    </ApplicationDefinition>
    <None Include="Properties\AppManifest.xml" />
    <Page Include="Page1.xaml">
      <Generator>MSBuild:Compile</Generator>
      <SubType>Designer</SubType>
    </Page>
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\..\Prism.StandardAspects.Validation.Silverlight\Prism.StandardAspects.Validation.Silverlight.oxygene">
      <Name>Prism.StandardAspects.Validation.Silverlight</Name>
      <Project>{21f00f20-31b7-4e87-a80a-864bcb5ec6f2}</Project>
      <Private>True</Private>
      <HintPath>..\..\Prism.StandardAspects.Validation.Silverlight\Bin\Debug\Validation.Silverlight.dll</HintPath>
    </ProjectReference>
    <ProjectReference Include="..\ValidationDomain.Silverlight\ValidationDomain.Silverlight.oxygene">
      <Name>ValidationDomain.Silverlight</Name>
      <Project>{b2aa992b-49f1-4e90-ab56-f8e4a4b7a77e}</Project>
      <Private>True</Private>
      <HintPath>..\ValidationDomain.Silverlight\Bin\Release\ValidationDomain.Silverlight.dll</HintPath>
    </ProjectReference>
  </ItemGroup>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Silverlight.targets" />
  <ProjectExtensions>
    <VisualStudio>
      <FlavorProperties GUID="{A1591282-1198-4647-A2B1-27E5FF5F6F3B}" xmlns="">
        <SilverlightProjectProperties>
        </SilverlightProjectProperties>
      </FlavorProperties>
    </VisualStudio>
  </ProjectExtensions>
</Project>