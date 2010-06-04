<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <OutputType>Library</OutputType>
    <RootNamespace>ValidationMVCApplication</RootNamespace>
    <AssemblyName>ValidationMVCApplication</AssemblyName>
    <Configuration Condition="'$(Configuration)' == ''">Debug</Configuration>
    <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
    <ProjectGuid>{ec6d9154-c674-4e7d-a1be-632f480a6905}</ProjectGuid>
    <ProjectTypeGuids>{349c5851-65df-11da-9384-00065b846f21};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <Name>ValidationMVCApplication</Name>
    <Company />
    <SilverlightApplicationList>{3D0B4FC3-140E-4AE4-B09C-11ABEC8DB0CF}|..\ValidationSilverlightApplication\ValidationSilverlightApplication.oxygene|ClientBin|False</SilverlightApplicationList>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <Optimize>false</Optimize>
    <OutputPath>./bin</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <OutputPath>./bin</OutputPath>
    <Optimize>true</Optimize>
    <EnableAsserts>False</EnableAsserts>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="mscorlib" />
    <Reference Include="System" />
    <Reference Include="System.Data" />
    <Reference Include="System.Core">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data.DataSetExtensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Xml.Linq">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Drawing" />
    <Reference Include="System.Web" />
    <Reference Include="System.Web.Abstractions" />
    <Reference Include="System.Web.Extensions" />
    <Reference Include="System.Web.Mvc" />
    <Reference Include="System.Web.Routing" />
    <Reference Include="System.Xml" />
    <Reference Include="System.Configuration" />
    <Reference Include="System.Web.Services" />
    <Reference Include="System.EnterpriseServices" />
    <Reference Include="System.Web.Mobile" />
  </ItemGroup>
  <ItemGroup>
    <Content Include="ClientBin\ValidationSilverlightApplication.xap" />
    <Content Include="Content\Site.css" />
    <Compile Include="Controllers\AccountController.pas" />
    <Compile Include="Controllers\EmployeeController.pas">
    </Compile>
    <Compile Include="Controllers\HomeController.pas" />
    <Content Include="Default.aspx" />
    <Compile Include="Default.aspx.pas">
      <Subtype>ASPXCodeBehind</Subtype>
      <DesignableClassName>ValidationMVCApplication._Default</DesignableClassName>
      <DependentUpon>Default.aspx</DependentUpon>
    </Compile>
    <Content Include="Global.asax" />
    <Compile Include="Global.asax.pas">
      <DependentUpon>Global.asax</DependentUpon>
    </Compile>
    <Compile Include="Properties\AssemblyInfo.pas" />
    <Content Include="Scripts\jquery-1.3.2.js" />
    <Content Include="Scripts\jquery-1.3.2.min.js" />
    <Content Include="Scripts\jquery-1.3.2.min-vsdoc.js" />
    <Content Include="Scripts\jquery-1.3.2-vsdoc.js" />
    <Content Include="Scripts\MicrosoftAjax.debug.js" />
    <Content Include="Scripts\MicrosoftAjax.js" />
    <Content Include="Scripts\MicrosoftMvcAjax.debug.js" />
    <Content Include="Scripts\MicrosoftMvcAjax.js" />
    <Content Include="Silverlight.js">
      <SubType>Content</SubType>
    </Content>
    <Content Include="ValidationSilverlightApplicationTestPage.aspx">
      <SubType>Content</SubType>
    </Content>
    <Content Include="ValidationSilverlightApplicationTestPage.html">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Views\Account\ChangePassword.aspx" />
    <Content Include="Views\Account\ChangePasswordSuccess.aspx" />
    <Content Include="Views\Account\LogOn.aspx" />
    <Content Include="Views\Account\Register.aspx" />
    <Content Include="Views\Employee\Edit.aspx">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Views\Employee\Index.aspx">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Views\Home\_Index.aspx" />
    <Content Include="Views\Home\About.aspx" />
    <Content Include="Views\Shared\Error.aspx" />
    <Content Include="Views\Shared\LogOnUserControl.ascx" />
    <Content Include="Views\Shared\Site.Master" />
    <Content Include="Views\Web.config" />
    <Content Include="Web.config" />
  </ItemGroup>
  <ItemGroup>
    <Folder Include="App_Data\" />
    <Folder Include="ClientBin\" />
    <Folder Include="Content\" />
    <Folder Include="Controllers\" />
    <Folder Include="Models\" />
    <Folder Include="Properties\" />
    <Folder Include="Scripts\" />
    <Folder Include="Views\" />
    <Folder Include="Views\Account\" />
    <Folder Include="Views\Home\" />
    <Folder Include="Views\Employee" />
    <Folder Include="Views\Shared\" />
  </ItemGroup>
  <ItemGroup>
    <ProjectReference Include="..\ValidationDomain\ValidationDomain.oxygene">
      <Name>ValidationDomain</Name>
      <Project>{60f1dcf6-2883-490f-9b0c-b1b57f8b895d}</Project>
      <Private>True</Private>
      <HintPath>..\ValidationDomain\bin\Debug\ValidationDomain.dll</HintPath>
    </ProjectReference>
  </ItemGroup>
  <ProjectExtensions>
    <VisualStudio>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}">
        <WebProjectProperties>
          <UseIIS>False</UseIIS>
          <AutoAssignPort>True</AutoAssignPort>
          <DevelopmentServerPort>49714</DevelopmentServerPort>
          <DevelopmentServerVPath>/</DevelopmentServerVPath>
          <IISUrl>
          </IISUrl>
          <NTLMAuthentication>False</NTLMAuthentication>
          <UseCustomServer>False</UseCustomServer>
          <CustomServerUrl>
          </CustomServerUrl>
          <SaveServerSettingsInUserFile>False</SaveServerSettingsInUserFile>
        </WebProjectProperties>
      </FlavorProperties>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}" User="">
        <WebProjectProperties>
          <StartPageUrl>ValidationSilverlightApplicationTestPage.html</StartPageUrl>
          <StartAction>SpecificPage</StartAction>
          <AspNetDebugging>True</AspNetDebugging>
          <SilverlightDebugging>True</SilverlightDebugging>
          <NativeDebugging>False</NativeDebugging>
          <SQLDebugging>False</SQLDebugging>
          <ExternalProgram>
          </ExternalProgram>
          <StartExternalURL>
          </StartExternalURL>
          <StartCmdLineArguments>
          </StartCmdLineArguments>
          <StartWorkingDirectory>
          </StartWorkingDirectory>
          <EnableENC>False</EnableENC>
          <AlwaysStartWebServerOnDebug>True</AlwaysStartWebServerOnDebug>
          <ProjectOutputReferences>
            <Ref Project="{3D0B4FC3-140E-4AE4-B09C-11ABEC8DB0CF}" Folder="ClientBin">ValidationSilverlightApplication.xap</Ref>
          </ProjectOutputReferences>
        </WebProjectProperties>
      </FlavorProperties>
    </VisualStudio>
  </ProjectExtensions>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.targets" />
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\VisualStudio\v10.0\WebApplications\Microsoft.WebApplication.targets" />
</Project>