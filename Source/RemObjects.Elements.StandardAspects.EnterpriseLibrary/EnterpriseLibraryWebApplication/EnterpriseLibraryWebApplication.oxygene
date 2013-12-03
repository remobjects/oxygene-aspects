<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003" DefaultTargets="Build" ToolsVersion="4.0">
    <PropertyGroup>
        <ProductVersion>3.5</ProductVersion>
        <ProjectTypeGuids>{349c5851-65df-11da-9384-00065b846f21};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
        <OutputType>Library</OutputType>
        <RootNamespace>EnterpriseLibraryWebApplication</RootNamespace>
        <AssemblyName>EnterpriseLibraryWebApplication</AssemblyName>
        <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
        <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
        <Name>EnterpriseLibraryWebApplication</Name>
        <ProjectGuid>{4751d4ed-a8ef-4f09-b434-a5a7b505363a}</ProjectGuid>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
        <DefineConstants>DEBUG;TRACE;</DefineConstants>
        <OutputPath>./bin</OutputPath>
        <GeneratePDB>True</GeneratePDB>
        <GenerateMDB>True</GenerateMDB>
    </PropertyGroup>
    <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
        <OutputPath>./bin</OutputPath>
        <EnableAsserts>False</EnableAsserts>
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
        <Reference Include="mscorlib">
            <HintPath>mscorlib.dll</HintPath>
        </Reference>
        <Reference Include="System"/>
        <Reference Include="System.Configuration"/>
        <Reference Include="System.Data"/>
        <Reference Include="System.Drawing"/>
        <Reference Include="System.EnterpriseServices"/>
        <Reference Include="System.ServiceModel">
            <HintPath>C:\Program Files\Reference Assemblies\Microsoft\Framework\v3.0\System.ServiceModel.dll</HintPath>
        </Reference>
        <Reference Include="System.ServiceModel.Web">
            <HintPath>C:\Program Files\Reference Assemblies\Microsoft\Framework\v3.5\System.ServiceModel.Web.dll</HintPath>
        </Reference>
        <Reference Include="System.Web"/>
        <Reference Include="System.Web.Mobile"/>
        <Reference Include="System.Web.Services"/>
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
        <ProjectReference Include="..\RemObjects.Elements.StandardAspects.EnterpriseLibrary.Aspects\RemObjects.Elements.StandardAspects.EnterpriseLibrary.Aspects.oxygene">
            <Name>RemObjects.Elements.StandardAspects.EnterpriseLibrary.Aspects</Name>
            <Project>{30680d6a-4c32-4634-ba49-823ed255e897}</Project>
            <Private>True</Private>
            <IsCirrusRef>True</IsCirrusRef>
        </ProjectReference>
        <ProjectReference Include="..\RemObjects.Elements.StandardAspects.EnterpriseLibrary\RemObjects.Elements.StandardAspects.EnterpriseLibrary.oxygene">
            <Name>RemObjects.Elements.StandardAspects.EnterpriseLibrary</Name>
            <Project>{5d070e1f-7122-4926-a3b8-20d87f918677}</Project>
            <Private>True</Private>
            <HintPath>..\RemObjects.Elements.StandardAspects.EnterpriseLibrary\bin\Debug\Moshine.EnterpriseLibrary.dll</HintPath>
        </ProjectReference>
    </ItemGroup>
    <ItemGroup>
        <Compile Include="IRestService.pas"/>
        <Compile Include="RestService.pas"/>
        <Content Include="Default.aspx"/>
        <Compile Include="Default.aspx.pas">
            <DependentUpon>Default.aspx</DependentUpon>
        </Compile>
        <Compile Include="Default.aspx.designer.pas">
            <DependentUpon>Default.aspx</DependentUpon>
            <SubType>ASPXCodeBehind</SubType>
            <DesignableClassName>EnterpriseLibraryWebApplication._Default</DesignableClassName>
        </Compile>
        <Content Include="Global.asax"/>
        <Compile Include="Global.asax.pas">
            <DependentUpon>Global.asax</DependentUpon>
        </Compile>
        <Content Include="RestService.svc">
            <SubType>Content</SubType>
        </Content>
        <Content Include="Web.config"/>
    </ItemGroup>
    <ItemGroup>
        <Folder Include="Properties\"/>
    </ItemGroup>
    <ProjectExtensions>
        <VisualStudio>
            <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}">
                <WebProjectProperties>
                    <UseIIS>False</UseIIS>
                    <AutoAssignPort>True</AutoAssignPort>
                    <DevelopmentServerPort>49225</DevelopmentServerPort>
                    <DevelopmentServerVPath>/</DevelopmentServerVPath>
                    <IISUrl/>
                    <NTLMAuthentication>False</NTLMAuthentication>
                    <UseCustomServer>False</UseCustomServer>
                    <CustomServerUrl/>
                    <SaveServerSettingsInUserFile>False</SaveServerSettingsInUserFile>
                </WebProjectProperties>
            </FlavorProperties>
            <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}" User="">
                <WebProjectProperties>
                    <StartPageUrl>RestService.svc</StartPageUrl>
                    <StartAction>SpecificPage</StartAction>
                    <AspNetDebugging>True</AspNetDebugging>
                    <SilverlightDebugging>False</SilverlightDebugging>
                    <NativeDebugging>False</NativeDebugging>
                    <SQLDebugging>False</SQLDebugging>
                    <ExternalProgram/>
                    <StartExternalURL/>
                    <StartCmdLineArguments/>
                    <StartWorkingDirectory/>
                    <EnableENC>False</EnableENC>
                    <AlwaysStartWebServerOnDebug>True</AlwaysStartWebServerOnDebug>
                </WebProjectProperties>
            </FlavorProperties>
        </VisualStudio>
    </ProjectExtensions>
    <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets"/>
    <Import Project="$(MSBuildExtensionsPath)\Microsoft\VisualStudio\v10.0\WebApplications\Microsoft.WebApplication.targets"/>
</Project>