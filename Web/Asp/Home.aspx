<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Web.Asp.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style>
        .logo {
            height: 40px;
            margin-top: -10px;
        }

        h1 {
            color: #100845;
        }

        h2 {
            color: #100845;
        }

        h3 {
            color: #2246ba;
        }

        h4 {
            color: #2246ba;
            font-style: italic;
            margin-left: 30px;
        }

        p {
            color: #393d76;
        }

        .lista-temario {
            list-style-type: none;
            color: #393d76;
            margin-left: 15px;
        }

        .parrafo-temario {
            margin-left: 40px;
        }

        .titulo-subtema {
            color: #2246ba;
        }

        .indice-link {
            text-decoration: none;
            color: #393d76;
        }

            .indice-link:hover {
                color: #2246ba;
            }

            .indice-link:visited {
                text-decoration: none;
                color: #393d76;
            }

        .imagen-centrada {
            margin-left: auto;
            margin-right: auto;
            width: 1000px;
        }

        .ruta {
            display: block;
            color: #333;
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-weight: bold;
            padding: 4px;
            margin-bottom: 10px;
        }

        .titulo-tema-contenido {
            padding-top: 30px;
            border-bottom: 3px solid black;
        }

        .titulo-subtema {
            padding-top: 100px;
            border-bottom: 1px solid #2246ba;
        }

        form {
            padding-bottom: 40px;
        }

        .boton-temario {
            color: #2246ba;
            border-radius: 4px;
            width: 30px;
            padding-left: 7px;
            float: right;
            left: 700px;
            cursor: pointer;
        }

            .boton-temario:hover {
                background-color: #a3c7fa;
            }

        .parrafo-contenido-steps {
            margin-left: 35px;
            color: #393d76;
        }

        .lista-contenido-steps {
            margin-left: 35px;
            color: #393d76;
        }

        .ruta-steps {
            display: block;
            color: #333;
            background-color: #f5f5f5;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-weight: bold;
            padding: 4px;
            margin-left: 35px;
        }

        .titulo-parrafo-contenido {
            padding-top: 10px;
            padding-bottom: 10px;
            font-size: 24px;
            color: #AAA;
        }

        .titulo-referencia {
            font-size: 16px;
            color: #777;
            font-weight: bold;
        }

        .link-referencia {
            padding-left: 20px;
        }
        ol.lista-codigo li{
            padding-top:5px;
            padding-bottom: 5px !important;
            color: #393d76;
        }
    </style>
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-inverse" role="navigation">
            <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Desplegar navegación</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Home.aspx">
                    <img src="../../Images/windows2.png" class="logo" />
                </a>
            </div>

            <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="Contactos/ListaContactos.aspx">Contactos</a></li>
                    <li><a href="#">Cuentas</a></li>
                </ul>
            </div>
        </nav>

        <%-- BREADCRUMB --%>
        <ol class="breadcrumb">
            <li class="active">Inicio</li>
        </ol>

        <form id="form1" runat="server">

            <div class="jumbotron">
                <div class="container">
                    <h1>SDK .NET Dynamics CRM</h1>
                    <p>
                        Todo lo que necesitas para comenzar a desarrollar aplicaciones y extensiones para Dynamics CRM.
                    </p>
                </div>
            </div>
            <h2>Objetivo del curso</h2>
            <p>
                Proveer una base solida de conocimeinto para el desarrollo de aplicaciones y extensiones para Dynamics CRM, utilizando tecnologías y métodos de desarrollo modernos para facilitar su comprensión.
            </p>
            <h2>Alcance de este curso</h2>
            <p>
                Este curso no pretende ser un curso de desarrollo de aplicaciones Web, estará enfocado únicamente en medios y herramientas necesarios 
                para lograr completar los objetivos de cada tema propuesto en relación con Dynamics CRM, por lo que es necesario contar con conocimiento previo y bien simentado del
                desarrollo de aplicaiones Web en todas sus formas.
            </p>
            <h2>Pre - requisitos</h2>
            <p>
                Para poder llevar a la conclusión exitosa de este curso es necesario contar con los siguientes requisitos:
            </p>
            <ul>
                <li>Instancia de Dynamics 365 para desarrollo. (De preferencia personal. Una de prueba)</li>
                <li>Visual Studio 2015 o superior (Cualquier version)</li>
                <li>Conocimiento básico de jQuery</li>
                <li>Conocimiento básico a intermedio de C#</li>
                <li>Conocimiento básico de Dynamics CRM (Deseable)</li>
                <li>Acceso a internet</li>
            </ul>
            <h2 id="Temario">Temario</h2>
            <h4><a href="#Tema1">1. Conociendo Dynamics CRM</a></h4>
            <p class="parrafo-temario">
                En esta sección se hará una breve introducción a Dynamics CRM para conocer como es que funciona y poder así comprender mejor los
                temas que serán tratados en este curso.
            </p>
            <ol class="lista-temario">
                <li><a href="#QueEsCRM" class="indice-link">1.1 - Que es Dynamics CRM</a></li>
                <li><a href="#EntidadesCRM" class="indice-link">1.2 - Entidades</a></li>
                <li><a href="#AtributosCRM" class="indice-link">1.3 - Atributos</a></li>
                <li><a href="#TipoDatosCRM" class="indice-link">1.4 - Tipos de dato</a></li>
                <li><a href="#RelacionesCRM" class="indice-link">1.5 - Relaciones</a></li>
                <li><a href="#FormulariosCRM" class="indice-link">1.6 - Formularios</a></li>
                <li><a href="#EventosFormularioCRM" class="indice-link">1.7 - Eventos de atributo y formulario</a></li>
                <li><a href="#MetadatosCRM" class="indice-link">1.8 - Metadatos</a></li>
                <li><a href="#FlujosTrabajoCRM" class="indice-link">1.9 - Flujos de trabajo</a></li>
                <li><a href="#SolucionesCRM" class="indice-link">1.10 - Soluciones</a></li>
            </ol>
            <h4><a href="#Tema2">2. SDK para Dynamics CRM con C#</a></h4>
            <p class="parrafo-temario">
                En esta sección construiremos una pequeña aplicación web que nos permita realizar las operaciones básicas en Dynamics CRM 
                o lo que comunmente se le denomina una aplicación <b>CRUD</b>.
            </p>
            <ol class="lista-temario">
                <li><a href="#SDKCRM" class="indice-link">2.1 - Descargando el SDK de Dynamics CRM</a></li>
                <li><a href="#VisualStudio" class="indice-link">2.2 - Configurando la solución de trabajo para Visual Studio</a></li>
                <li><a href="#ConexionCRM" class="indice-link">2.3 - Conexión a Dynamics CRM</a></li>
                <li><a href="#ObtenerListadoCRM" class="indice-link">2.4 - Obtener listado de registros de entidad</a></li>
                <li><a href="#CrearEntidadCRM" class="indice-link">2.5 - Crear un registro de entidad</a></li>
                <li><a href="#ObtenerEntidadCRM" class="indice-link">2.6 - Obtener un registro de entidad</a></li>
                <li><a href="#ActualizarEntidadCRM" class="indice-link">2.7 - Actualizar un registro de entidad</a></li>
                <li><a href="#EliminarEntidadCRM" class="indice-link">2.8 - Borrar un registro de entidad</a></li>
                <li><a href="#PracticaSDKCRM" class="indice-link">2.9 - Práctica</a></li>
                <li><a href="#OtrasAccionesCRM" class="indice-link">2.10 - Complementos y otras acciones</a></li>

            </ol>
            <h4><a href="#Tema3">3. Ensamblados (Extensiones para Dynamics CRM)</a></h4>
            <p class="parrafo-temario">
                En esta sección construiremos dos tipos de elemento que nos permiten extender la funcionalidad de Dynamics CRM: Plugin y Custom Workflow Activity. 
                Tambien aprenderemos a registrarlos en Dynamics CRm con la herramienta Plugin Registration Tool.
            </p>
            <ol class="lista-temario">
                <li><a href="#EntendiendoPluginsCRM" class="indice-link">3.1 - Entendiendo los Plugins</a></li>
                <li><a href="#ConstruirPluginCRM" class="indice-link">3.2 - Construir un Plugin</a></li>
                <li><a href="#RegistrarPluginCRM" class="indice-link">3.3 - Registrar el Plugin en Dynamics CRM</a></li>
                <li><a href="#EntendiendoWACRM" class="indice-link">3.4 - Entendiendo los Custom Workflow Activities (WA)</a></li>
                <li><a href="#ConstruirWACRM" class="indice-link">3.5 - Construir un Custom Workflow Activity</a></li>
                <li><a href="#RegistrarWACRM" class="indice-link">3.6 - Registrar el Custom Workflow Activity en Dynamics CRM</a></li>
                <li><a href="#pluginRegistrationTool" class="indice-link">3.7 - Herramienta Plugin Registration Tool</a></li>
                <li><a href="#PracticaEnsambladosCRM" class="indice-link">3.8 - Práctica</a></li>
                <li><a href="#EnsambladosComplementos" class="indice-link">3.9 - Complementos </a></li>
            </ol>
            <hr />



            <%-- TEMA 1 - 1. Conociendo Dynamics CRM --%>
            <h1 id="Tema1" class="titulo-tema-contenido">1. Conociendo Dynamics CRM</h1>
            <p class="parrafo-contenido">
                Esta sección no pretende ser una guia completa del uso de Dynamics CRm, más bien, pretende proveer los conocieminetos y definiciones básicas
                de los elementos que conforman el uso de la plataforma de Dynamics CRM y para la cual se orienta el tema de desarrollo de este curso.
            </p>
            <p>Si ocupa conocer más a fondo acerca de Dynamics CRM 365 puede ver la siguiente referencia a la documentación:</p>
            <p><b>Referencia: </b><a href="https://msdn.microsoft.com/es-es/library/dn481567.aspx" target="_blank">Kit de desarrollo de software de Microsoft Dynamics 365 (online) y Dynamics 365 (local)</a></p>






            <%-- 1.1 ¿Que es Microsoft Dynamics 365? --%>
            <h3 id="QueEsCRM" class="titulo-subtema">1.1 ¿Que es Microsoft Dynamics 365? <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Dynamics 365 (anteriormente conocido como Dynamics CRM) proporciona una eficaz plataforma de aplicaciones empresariales que ofrece a los clientes, asociados de Microsoft y fabricantes de software independiente (ISV) una oportunidad de ampliar y proporcionar soluciones con valor añadido. Estas soluciones se añaden a las sólidas funcionalidades básicas de la plataforma incluidas con Dynamics 365. Mediante estas funcionalidades, 
                puede crear soluciones personalizadas sin necesidad de compilar la base de manera personalizada.
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-mx/dynamics365/crmdevelopercenter.aspx" target="_blank">¿Que es Microsoft Dynamics 365?</a></b>
            </p>
            <p class="text-center">
                <img src="../Images/1.QueEsCRM.png" class="imagen-centrada" />
            </p>






            <%-- 1.2 Entidades --%>
            <h3 id="EntidadesCRM" class="titulo-subtema">1.2 Entidades <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Las entidades se utilizan para modelar y administrar datos profesionales en Microsoft Dynamics 365. ... 
                Una entidad tiene un conjunto de atributos, cada uno de los cuales representa un elemento de datos de un tipo determinado.
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg309396.aspx" target="_blank">Introducción a entidades en Microsoft Dynamics 365</a></b>
            </p>
            <p>
                Para acceder a ver las entidades que se encuentran definidas en Dynamics 365 siga los siguientes pasos:                
            </p>
            <div class="ruta">
                Configuración -> Personalizaciones -> Personalizar el sistema -> Componentes -> Entidades
            </div>





            <%-- 1.3 Atributos --%>
            <h3 id="AtributosCRM" class="titulo-subtema">1.3 Atributos <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Las entidades incluyen un conjunto de atributos que representan los datos que se pueden incluir en cada registro. Los programadores deben comprender los diferentes tipos de atributos y cómo trabajar con ellos.
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg309396.aspx" target="_blank">Introducción a los atributos de entidad de Microsoft Dynamics 365</a></b>
            </p>
            <p>
                Para acceder a ver los atributos de las entidades que se encuentran definidas en Dynamics 365 siga los siguientes pasos:                
            </p>
            <div class="ruta">
                Configuración -> Personalizaciones -> Personalizar el sistema -> Componentes -> Entidades -> [Entidad deseada] -> Campos
            </div>



            <%-- 1.4 - Tipos de dato --%>
            <h3 id="TipoDatosCRM" class="titulo-subtema">1.4 - Tipos de dato <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Dynamics 365 acepta diferentes tipo de datos que se enlistan a continuación:
            </p>
            <ol>
                <li>Líneas de texto única</li>
                <li>Múltiples líneas de texto</li>
                <li>Conjuntos de opciones</li>
                <li>Dos opciones</li>
                <li>Imágenes</li>
                <li>Números enteros</li>
                <li>Números flotantes</li>
                <li>Números decimales</li>
                <li>Moneda</li>
                <li>Fecha y hora</li>
                <li>Búsqueda</li>

            </ol>
            <p>
                <b>Referencia: <a href="https://community.dynamics.com/crm/b/xrmcenter/archive/2016/06/23/data-types-in-microsoft-dynamic-crm" target="_blank">Data Types in Microsoft Dynamic CRM</a></b><br />
            </p>




            <%-- 1.5 Relaciones --%>
            <h3 id="RelacionesCRM" class="titulo-subtema">1.5 Relaciones <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Las relaciones de entidad definen cómo pueden relacionarse los registros entre sí en la base de datos.            
            </p>
            <p>
                <b>Referencia: <a href="https://technet.microsoft.com/es-es/library/dn531171.aspx" target="_blank">Crear y editar relaciones entre entidades</a></b>
                <br />
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg309412.aspx" target="_blank">Comportamiento de relación de entidades</a></b>
            </p>





            <%-- 1.6 Formularios --%>
            <h3 id="FormulariosCRM" class="titulo-subtema">1.6 Formularios <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Los formularios ofrecen la interfaz de usuario (UI) que los usuarios usan para crear, ver, o editar registros de la entidad. 
                Use el diseñador de formulario en las herramientas de personalización para crear y modificar formularios de entidad
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg334527.aspx#BKMK_CreateAndEditForms" target="_blank">Personalizar los formularios de entidad</a></b><br />
                <b>Referencia: <a href="https://technet.microsoft.com/library/dn531143.aspx" target="_blank">Crear y diseñar formularios</a></b>
            </p>
            <p>
                Para acceder a ver los formularios de las entidades que se encuentran definidas en Dynamics 365 siga los siguientes pasos:                
            </p>
            <div class="ruta">
                Configuración -> Personalizaciones -> Personalizar el sistema -> Componentes -> Entidades -> [Entidad deseada] -> Formularios
            </div>


            <%-- 1.7 - Eventos de atributo y formulario --%>
            <h3 id="EventosFormularioCRM" class="titulo-subtema">1.7 - Eventos de atributo y formulario <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Todo el código del lado cliente es iniciado por eventos. En Microsoft Dynamics 365, se asociará una característica específica en una biblioteca de JavaScript para ejecutarla cuando se produce algún determinados eventos.
            </p>
            <p>
                Todos los eventos de formulario tienen una interfaz de usuario que se usa para especificar uno o varios controladores de evento. Cada controlador de evento especifica una sola función de una biblioteca de JavaScript y los parámetros que pueden pasarse a la función.
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg334481.aspx" target="_blank">Eventos de formulario (referencia del lado del cliente)</a></b>
                <br />
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg334701.aspx" target="_blank">Usar formularios y eventos de campo</a></b>
            </p>
            <p>
                Para acceder a ver los eventos de formularios de las entidades que se encuentran definidas en Dynamics 365 siga los siguientes pasos:                
            </p>
            <div class="ruta">
                Configuración -> Personalizaciones -> Personalizar el sistema -> Componentes -> Entidades -> [Entidad deseada] -> Formularios
            </div>
            <br />
            <p>
                Abra el formulario deseado y de clic en el botón <b>Propiedades del formulario</b> en el Ribbon:
            </p>
            <p class="text-center">
                <img src="../Images/2.PropiedadesFormulario.png" />
            </p>
            <p>
                A continuación seleccione el control al que desea adjuntarle el evento, seleccione el evento y agregue el controldaor de evento deseado de una
                de las bibliotecas de código javascript que se hayan cargado previamente.
            </p>
            <p class="text-center">
                <img src="../Images/3.EventosFormulario.png" />
            </p>


            <%-- 1.8 Metadatos --%>
            <h3 id="MetadatosCRM" class="titulo-subtema">1.8 Metadatos <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Los metadatos hacen referencia a la estructura de entidades que se usan para administrar datos dentro de Microsoft Dynamics 365. Prácticamente todas las tareas para administrar metadatos pueden realizarse con herramientas de personalización en la aplicación de Dynamics 365.
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg309539.aspx" target="_blank">Usar el servicio de la organización con metadatos de Dynamics 365</a></b>
            </p>



            <%-- 1.9 Flujos de trabajo --%>
            <h3 id="FlujosTrabajoCRM" class="titulo-subtema">1.9 Flujos de trabajo <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Los procesos de negocio son parte integrante de cualquier aplicación de software de empresa. Los procesos de negocio pueden ser de dos tipos: procesos automatizados que confían solo en la comunicación entre aplicaciones basándose en un conjunto de reglas, 
                y procesos interactivos que también dependen de personas para iniciar y ejecutar el proceso y para tomar las decisiones adecuadas durante la ejecución del proceso.
            </p>
            <p>
                <b>Referencia: <a href="https://technet.microsoft.com/es-es/library/dn531067.aspx" target="_blank">Procesos del flujo de trabajo</a></b><br />
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg328264.aspx" target="_blank">Automatizar procesos de negocio mediante proceso de Dynamics 365</a></b>
            </p>
            <p>
                Para acceder a los procesos que se encuentran definidos en Dynamics 365 siga los siguientes pasos:                
            </p>
            <div class="ruta">
                Configuración -> Procesos
            </div>



            <%-- 1.10 Soluciones --%>
            <h3 id="SolucionesCRM" class="titulo-subtema">1.10 Soluciones <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Las soluciones son cómo los personalizadores y desarrolladores crean, empaquetan y mantienen las unidades de software que extienden Microsoft Dynamics 365 (en línea y local). 
                Los personalizadores y los desarrolladores distribuyen soluciones de modo que las organizaciones puedan usar Microsoft Dynamics 365 para instalar y desinstalar la funcionalidad de su negocio definida por la solución.
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-mx/library/gg334576.aspx" target="_blank">Introducción a soluciones</a></b><br />
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg509069.aspx" target="_blank">Trabajar con soluciones</a></b>
            </p>









            <%-- TEMA 2 - 2. SDK para Dynamics CRM con C# --%>
            <h1 id="Tema2" class="titulo-tema-contenido">2. SDK para Dynamics CRM con C#</h1>
            <p class="parrafo-contenido">
                En esta sección llevaremos la construccción de una aplicación <b>CRUD</b> que nos permita entender las bases del desarrollo con
                Dynamics 365.
            </p>
            <p class="parrafo-contenido">
                El SDK de desarrollo para Dynamics 365 es muy extenso por lo que no se verá en su totalidad en este curso, pero si definiremos una guía de los 
                conceptos necesarios para buscar dentro de la documentación y ejemplos que proveen Microsoft y otros sitios en internet y así ampliar el 
                dominio de conocimiento de desarrollo de Dynamics 365.
            </p>
            <p>Si ocupa conocer más a fondo acerca del desarrollo de Dynamics 365 puede ver la siguiente referencia de ejemplos de código:</p>
            <p><b>Referencia: </b><a href="https://msdn.microsoft.com/es-mx/library/gg309721.aspx" target="_blank">Directorio de código de ejemplo para Microsoft Dynamics 365</a></p>






            <%-- 2.1 - Descargando el SDK de Dynamics CRM --%>
            <h3 id="SDKCRM" class="titulo-subtema">2.1 - Descargando el SDK de Dynamics CRM <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Lo primero que debemos de hacer para comenzar a trabajar es obtener el Kit de Desarrollo de Software (SDK) para Dynamics 365 y lo podemos obtener
                desde el siguiente enlace <a href="https://www.microsoft.com/en-US/download/details.aspx?id=50032" target="_blank">Microsoft Dynamics 365 Software Development Kit (SDK)</a>
            </p>
            <p class="parrafo-contenido">
                El SDK contiene:
            </p>
            <ul>
                <li>Librerías de desarrollo</li>
                <li>Documentación</li>
                <li>Herramientas de desarrollo</li>
                <li>Plantillas para Visual Studio</li>
                <li>Código de ejemplo</li>
            </ul>
            <p class="parrafo-contenido">
                Para información actualizada puede ver:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-mx/library/hh547453.aspx" target="_blank">Kit de desarrollo de software de Microsoft Dynamics 365 (online) y Dynamics 365 (local)</a></b>
            </p>



            <%-- 2.2 - Configurando la solución de trabajo para Visual Studio --%>
            <h3 id="VisualStudio" class="titulo-subtema">2.2 - Configurando la solución de trabajo para Visual Studio <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Ahora es necesario comenzar a configurar nuestro entorno de desarrollo, por lo que el primer paso es descargar la  <b><a href="http://cursocrmudemweb.azurewebsites.net/_plantillaproyecto/curso.crm.udem.zip" target="_blank">Plantilla de proyecto para Visual Studio 2017</a></b>,
                una vez descargada se descomprime en una carpeta deseada y abrimos la solución.
            </p>
            <p class="parrafo-contenido">
                Para la configuración del entorno de trabajo es necesario seguir los siguientes pasos:
            </p>
            <h4>1. Crear proyecto compartido: <b>Librerias.Crm.Shared</b></h4>
            <p class="parrafo-contenido-steps">
                Para crear un proyecto compartido:
            </p>
            <ol class="lista-contenido-steps">
                <li>Dar clic derecho en el nombre de solución de visual studio: Curso.Crm.Udem</li>
                <li>Seleccionar <b>Add -> New Project...</b></li>
                <li>Seleccionamos la opción <b>Visual C#</b> y buscamos el tipo de proyecto <b>Shared Project</b>, asignamos el nombre <b>Librerias.Crm.Shared</b> y presionamos <b>OK</b></li>
            </ol>


            <h4>2. Crear proyecto Librería de Clases: <b>Librerias.Crm</b></h4>
            <p class="parrafo-contenido-steps">
                Para crear un proyecto de tipo Librería de clases:
            </p>
            <ol class="lista-contenido-steps">
                <li>Dar clic derecho en el nombre de solución de visual studio: Curso.Crm.Udem</li>
                <li>Seleccionar <b>Add -> New Project...</b></li>
                <li>Seleccionamos la opción <b>Visual C# -> Windows Classic Desktop</b> y buscamos el tipo de proyecto <b>Class Library (.NET Framework)</b>, asignamos el nombre <b>Librerias.Crm</b>, nos aseguramos de seleccionar la versión <b>.NET Framework 4.5.2</b>  y presionamos <b>OK</b></li>
            </ol>
            <p class="parrafo-contenido-steps">
                Después es necesario agregar las siguientes referencias al proyecto:
            </p>
            <ul class="lista-contenido-steps">
                <li>System.Web.Services</li>
                <li>System.Activities</li>
                <li>Librerias.Crm.Shared</li>
            </ul>



            <h4>3. Crear proyecto Librería de Clases: <b>Librerias.Crm.Conexion</b></h4>
            <p class="parrafo-contenido-steps">
                Para crear un proyecto de tipo Librería de clases:
            </p>
            <ol class="lista-contenido-steps">
                <li>Dar clic derecho en el nombre de solución de visual studio: Curso.Crm.Udem</li>
                <li>Seleccionar <b>Add -> New Project...</b></li>
                <li>Seleccionamos la opción <b>Visual C# -> Windows Classic Desktop</b> y buscamos el tipo de proyecto <b>Class Library (.NET Framework)</b>, asignamos el nombre <b>Librerias.Crm.Conexion</b>, nos aseguramos de seleccionar la versión <b>.NET Framework 4.5.2</b>  y presionamos <b>OK</b></li>
            </ol>
            <p class="parrafo-contenido-steps">
                Después es necesario agregar las siguientes referencias al proyecto:
            </p>
            <ul class="lista-contenido-steps">
                <li>System.Configuration</li>
                <li>System.ServiceModel</li>
                <li>Microsoft.Xrm.Sdk</li>
                <li>Microsoft.Xrm.Tooling.Connector</li>
            </ul>


            <h4>4. Crear proyecto Librería de Clases: <b>Ensamblados.Crm</b></h4>
            <p class="parrafo-contenido-steps">
                Para crear un proyecto de tipo Librería de clases:
            </p>
            <ol class="lista-contenido-steps">
                <li>Dar clic derecho en el nombre de solución de visual studio: Curso.Crm.Udem</li>
                <li>Seleccionar <b>Add -> New Project...</b></li>
                <li>Seleccionamos la opción <b>Visual C# -> Windows Classic Desktop</b> y buscamos el tipo de proyecto <b>Class Library (.NET Framework)</b>, asignamos el nombre <b>Ensamblados.Crm</b>, nos aseguramos de seleccionar la versión <b>.NET Framework 4.5.2</b> y presionamos <b>OK</b></li>
            </ol>
            <p class="parrafo-contenido-steps">
                Después es necesario agregar las siguientes referencias al proyecto:
            </p>
            <ul class="lista-contenido-steps">
                <li>System.Web.Services</li>
                <li>System.Activities</li>
                <li>Microsoft.Xrm.Sdk</li>
                <li>Microsoft.Xrm.Sdk.Proxy</li>
                <li>Librerias.Crm.Shared</li>
            </ul>
            <p class="parrafo-contenido-steps">
                Este proyecto contendrá una libreria de ensamblados para Dynamics 365, la cual deberá registrarse en la instancia de CRM y para ello
                será necesario firmar la librería de la siguiente manera:
            </p>
            <ol class="lista-contenido-steps">
                <li>Dar clic derecho en el nombre de proyecto: <b>Ensamblados.Crm</b> y seleccionar <b>Properties.</b></li>
                <li>
                    <p>
                        Seleccionar la pestaña <b>Signing</b> y dar clic en el checkbox <b>Signt the assembly</b>
                    </p>
                    <p class="text-center">
                        <img src="../Images/4.FirmarEnsamblado.png" />
                    </p>
                </li>
                <li>
                    <p>
                        Dar clic en la lista desplegable y seleccionar <b>New...</b>
                    </p>
                    <p class="text-center">
                        <img src="../Images/5.FirmarEnsamblado2.png" />
                    </p>
                </li>
                <li>
                    <p>
                        Escribir el nombre del archivo de firma, que en este caso será igual que de nombre de proyecto, quitar la casilla de protección por password y damos clic en  <b>OK.</b>
                    </p>
                    <p class="text-center">
                        <img src="../Images/6.FirmarEnsamblado3.png" />
                    </p>
                </li>
                <li>Guardamos los cambios.</li>
            </ol>


            <h4>5. Configuración de proyecto: <b>Web</b></h4>
            <p class="parrafo-contenido-steps">
                Como el proyecto Web ya ha sido creado, será necesario agregar las referencias y configurar nuestra cadena de conexión a Dynamics 365.
            </p>
            <p class="parrafo-contenido-steps">
                Las referencias necesarias pra el proyecto son:
            </p>
            <ul class="lista-contenido-steps">
                <li>Librerias.Crm</li>
                <li>Librerias.Crm.Conexion</li>
                <li>Microsoft.Xrm.Sdk</li>
                <li>Microsoft.IdentityModel.Clients.ActiveDirectory</li>
            </ul>
            <p class="parrafo-contenido-steps">
                La cadena de conexión será agregada al archivo <b>web.config</b> de nuestro proyecto, y para ello es necesario agregar una sección más dentro de
                la etiqueta &lt;configuration&gt; llamada <b>&lt;connectionStrings&gt;</b> que llevará la siguiente información:
                
                
            </p>
            <div class="ruta-steps">
                &lt;add name="[NombreConexion]" connectionString="Url=[Instancia CRM]; Username=[nombre de usuario]; Password=[Password]; authtype=Office365"/&gt;
            </div>




            <%-- 2.3 - Conexión a Dynamics CRM --%>
            <h3 id="ConexionCRM" class="titulo-subtema">2.3 - Conexión a Dynamics CRM <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                La conexión a Dynamics 365 es la forma de autenticar un usuario en la plataforma y puede ser obtenida de varias maneras con el SDK de Dynamics 365, 
                pero en este curso nos enfocaremos solo en una de estas, la Conexión Simplificada a Dynamics 365.
            </p>
            <p class="parrafo-contenido">
                Para conocer otras formas de autenticarse a Dynamics 365 vea la siguiente referencia:
            </p>
            <p class="parrafo-contenido">
                <b>Referencia: <a href="https://msdn.microsoft.com/es-mx/library/mt608055.aspx" target="_blank">Conectarse a Microsoft Dynamics 365</a></b>
            </p>
            <p class="titulo-parrafo-contenido">
                Utilizar Clase CrmServiceClient
            </p>
            <p class="parrafo-contenido">
                En esta sección crearemos una clase de conexión a Dynamics 365 dentro del proyecto <b>Librerias.Crm.Conexión</b>, la cual utilizará la clase
                <b>CrmServiceClient</b> perteneciente a la biblioteca <b>Microsoft.Xrm.Tooling.Connector</b> la cual actua como un <b>Factory</b> que puede
                proveernos el objeto <b>IOrganizationService</b> perteneciente a la bibliteca <b>Microsoft.Xrm.Sdk</b> que es el objeto necesario para realizar cualquier acción a nuestra instancias de Dynamics 365.
            </p>

            <p class="parrafo-contenido">
                Para más información relacionada a la clase <b>CrmServiceClient</b> y como utilizarla vea las siguientes referencias:
            </p>
            <p>
                <b>Referencia: 
                    <a href="https://msdn.microsoft.com/en-us/library/microsoft.xrm.tooling.connector.crmserviceclient.aspx" target="_blank">CrmServiceClient Class</a></b>
                <br />
                <b>Referencia: 
                    <a href="https://msdn.microsoft.com/es-mx/library/mt608573.aspx" target="_blank">Usar cadenas de conexión en útiles de XRM para conectarse a Dynamics 365</a></b>
                <br />
                <b>Referencia: 
                    <a href="https://msdn.microsoft.com/es-mx/library/dn688177.aspx" target="_blank">Usar constructores CrmServiceClient para conectarse a Dynamics 365</a></b>
                <br />
                <b>Referencia: 
                    <a href="https://rajeevpentyala.com/2016/12/11/code-snippet-connect-to-dynamics-crm-using-organization-service-c/" target="_blank">Code snippet – Connect to Dynamics CRM using Organization Service C#</a></b>

            </p>

            <%-- 2.4 - Obtener listado de registros de entidad --%>
            <h3 id="ObtenerListadoCRM" class="titulo-subtema">2.4 - Obtener listado de registros de entidad <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Para llevar a cabo esta acción es necesario utilizar el Servicio de la Organización de Dynamics CRM y por medio del SDK
                utilizamos el objeto <b>IOrganizationService</b> perteneciente a la biblioteca <b>Microsoft.Xrm.Sdk.</b>
            </p>
            <p class="parrafo-contenido">
                Por medio de este objeto podemos realizar numerosas operaciones de servicio web además de las básicas que son Crear, Actualizar, Leer y Eliminar un registro de entidad. 
                Para más información acerca de las las operaciones que pueden ser realizadas por medio del servicio de organización vea las siguientes referencias:
            </p>
            <p class="parrafo-contenido">
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/mt608074.aspx" target="_blank">Usar el servicio de la organización de Microsoft Dynamics 365</a></b>
            </p>
            <p class="titulo-parrafo-contenido">
                Utilizar método RetrieveMultiple
            </p>
            <p class="parrafo-contenido">
                Para realizar una consulta a Dynamics 365 es necesario utilizar el método <b>IOrganizationService.RetrieveMultiple</b> el cuál requiere de un objeto de tipo <b>QueryBase</b> en la siguiente forma:
            </p>
            <div class="ruta">
                EntityCollection IOrganizationService.RetrieveMultiple(QueryBase query);
            </div>
            <p class="parrafo-contenido">
                Este método devuelve una colección de entidades que puede ser accedida desde la propiedad <b>EntityCollection.Entities</b>, en la instancia del objeto devuelto por RetrieveMultiple.
            </p>
            <p class="titulo-parrafo-contenido">
                Construir el objeto QueryBase
            </p>
            <p class="parrafo-contenido">
                Para obtener el listado de registros de entidad utilizaremos la clase <b>QueryExpression</b> que hereda de <b>QueryBase</b>. 
                Para armar la consulta es necesario construir estos objetos en el siguiente órden:
            </p>

            <ol>
                <li><a href="https://msdn.microsoft.com/es-mx/library/gg309532.aspx" target="_blank">ColumnSet</a></li>
                <li><a href="https://msdn.microsoft.com/es-mx/library/gg334419.aspx" target="_blank">ConditionExpression</a> </li>
                <li><a href="https://msdn.microsoft.com/es-mx/library/gg309410.aspx" target="_blank">FilterExpresion</a> </li>
                <li><a href="https://msdn.microsoft.com/en-us/library/microsoft.xrm.sdk.query.queryexpression.aspx" target="_blank">QueryExpression</a> </li>
            </ol>
            <p class="parrafo-contenido">
                Para más información relacionada al método <b>RetrieveMultiple</b> y como utilizarlo vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/microsoft.xrm.sdk.iorganizationservice.retrievemultiple.aspx" target="_blank">Método IOrganizationService.RetrieveMultiple</a></b>
            </p>






            <%-- 2.5 - Crear un registro de entidad --%>
            <h3 id="CrearEntidadCRM" class="titulo-subtema">2.5 - Crear un registro de entidad <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Para llevar a cabo esta acción es necesario utilizar el Servicio de la Organización de Dynamics CRM y por medio del SDK
                utilizamos el objeto <b>IOrganizationService</b> perteneciente a la biblioteca <b>Microsoft.Xrm.Sdk.</b>
            </p>
            <p class="titulo-parrafo-contenido">
                Utilizar método Create
            </p>
            <p class="parrafo-contenido">
                Para crear un registro de entidad en Dynamics 365 es necesario utilizar el método <b>IOrganizationService.Create</b> el cuál requiere de un objeto de tipo <b>Entity</b> en la siguiente forma:
            </p>
            <div class="ruta">
                Guid IOrganizationService.Create(Entity entity);
            </div>
            <p class="parrafo-contenido">
                Este método devuelve un <b>Guid</b> de la entidad creada, en dado caso que suceda un error generará una excepción.
            </p>
            <p class="parrafo-contenido">
                Para más información relacionada al método <b>Create</b> y como utilizarlo vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/microsoft.xrm.sdk.iorganizationservice.create.aspx" target="_blank">Método IOrganizationService.Create</a></b>
            </p>



            <%-- 2.6 - Obtener un registro de entidad --%>
            <h3 id="ObtenerEntidadCRM" class="titulo-subtema">2.6 - Obtener un registro de entidad <a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Para llevar a cabo esta acción es necesario utilizar el Servicio de la Organización de Dynamics CRM y por medio del SDK
                utilizamos el objeto <b>IOrganizationService</b> perteneciente a la biblioteca <b>Microsoft.Xrm.Sdk.</b>
            </p>
            <p class="titulo-parrafo-contenido">
                Utilizar método Retrieve
            </p>
            <p class="parrafo-contenido">
                Para realizar una consulta de un solo registro de entidad en Dynamics 365 es necesario utilizar el método <b>IOrganizationService.Retrieve</b> el cuál requiere del <b>nombre de la entidad</b>, el <b>ID del registro</b> y las <b>Columnas deseadas</b> del registro.
            </p>
            <div class="ruta">
                Entity IOrganizationService.Retrieve(string entityName, Guid id, ColumnSet columnSet);
            </div>
            <p class="parrafo-contenido">
                Este método devuelve un objeto <b>Entity</b>, que contiene la información de la entidad que fué consultada.
            </p>
            <p class="parrafo-contenido">
                Para más información relacionada al método <b>Retrieve</b> y como utilizarlo vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/microsoft.xrm.sdk.iorganizationservice.retrieve.aspx" target="_blank">Método IOrganizationService.Retrieve</a></b>
            </p>




            <%-- 2.7 - Actualizar un registro de entidad --%>
            <h3 id="ActualizarEntidadCRM" class="titulo-subtema">2.7 - Actualizar un registro de entidad<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Para llevar a cabo esta acción es necesario utilizar el Servicio de la Organización de Dynamics CRM y por medio del SDK
                utilizamos el objeto <b>IOrganizationService</b> perteneciente a la biblioteca <b>Microsoft.Xrm.Sdk.</b>
            </p>
            <p class="titulo-parrafo-contenido">
                Utilizar método Update
            </p>
            <p class="parrafo-contenido">
                Para actualizar un registro de entidad de Dynamics 365 es necesario utilizar el método <b>IOrganizationService.Update</b> el cuál requiere del <b>nombre de la entidad</b>, el <b>ID del registro</b> y las <b>Columnas deseadas</b> del registro.
            </p>
            <div class="ruta">
                void IOrganizationService.Update(Entity entity);
            </div>
            <p class="parrafo-contenido">
                Este método no devuelve ningún tipo de dato.
            </p>
            <p class="parrafo-contenido">
                Para más información relacionada al método <b>Update</b> y como utilizarlo vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/microsoft.xrm.sdk.iorganizationservice.update.aspx" target="_blank">Método IOrganizationService.Update</a></b>
            </p>





            <%-- 2.8 - Borrar un registro de entidad --%>
            <h3 id="EliminarEntidadCRM" class="titulo-subtema">2.8 - Borrar un registro de entidad<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Para llevar a cabo esta acción es necesario utilizar el Servicio de la Organización de Dynamics CRM y por medio del SDK
                utilizamos el objeto <b>IOrganizationService</b> perteneciente a la biblioteca <b>Microsoft.Xrm.Sdk.</b>
            </p>
            <p class="titulo-parrafo-contenido">
                Utilizar método Delete
            </p>
            <p class="parrafo-contenido">
                Para borrar un registro de entidad de Dynamics 365 es necesario utilizar el método <b>IOrganizationService.Delete</b> el cuál requiere del <b>nombre de la entidad</b> y el <b>ID del registro</b>.
            </p>
            <div class="ruta">
                void IOrganizationService.Delete(string entityName, Guid id);
            </div>
            <p class="parrafo-contenido">
                Este método no devuelve ningún tipo de dato.
            </p>
            <p class="parrafo-contenido">
                Para más información relacionada al método <b>Delete</b> y como utilizarlo vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/microsoft.xrm.sdk.iorganizationservice.delete.aspx" target="_blank">Método IOrganizationService.Delete</a></b>
            </p>




            <%-- 2.9 - Práctica --%>
            <h3 id="PracticaSDKCRM" class="titulo-subtema">2.9 - Práctica<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Para practicar los ejercicios anteriores deberemos de crear una aplicación <b>CRUD</b> para <b>Cuentas</b>
            </p>
            <p class="parrafo-contenido">
                Se recomienda copiar el código HTML de las páginas anteriores y adaptarlo para Cuentas.
            </p>

            <p class="titulo-parrafo-contenido">
                Actividades
            </p>
            <p class="parrafo-contenido">
                Para completar esta práctica se deben terminar las siguientes actividades:
            </p>
            <ul>
                <li>Crear una carpeta llamada <b>Cuentas</b> dentro de la carpeta <b>Asp</b> del proyecto <b>Web</b>.</li>
                <li>Crear las páginas: 
                    <ol>
                        <li>ListaCuentas.aspx</li>
                        <li>CrearCuenta.aspx</li>
                        <li>EditarCuenta.aspx</li>
                    </ol>
                </li>
                <li>Crear los métodos en la clase CuentaServicio:
                    <ol>
                        <li>ObtenerCuentas</li>
                        <li>ObtenerCuentaPorID</li>
                        <li>Guardar</li>
                        <li>Eliminar</li>
                    </ol>
                </li>
                <li>Actualizar la navegación para estas páginas</li>
            </ul>

            <%-- 2.10 - Complementos y otras acciones --%>
            <h3 id="OtrasAccionesCRM" class="titulo-subtema">2.10 - Complementos y otras acciones<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Las formas de interacción con Dynamics 365 presentadas en este curso no representan la totalidad de operaciones distintas que se pueden llevar a cabo en Dynamics 365,
                existen múltiples formas de llevar una acción por medio del SDK y cada una ayuda de forma distinta a resolver una necesidad para Dynamics 365.
            </p>
            <p class="parrafo-contenido">
                La intención de esta sección es dejar documentación de referencia a muchas otras formas de usar el SDK de Dynamics CRM.
            </p>
            <p class="titulo-parrafo-contenido">
                Referencias
            </p>
            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Ejemplo completo del uso de los métodos CRUD por Late Bound:
                </span>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-mx/library/gg328416.aspx" target="_blank">Ejemplo: crear, recuperar, actualizar y eliminar (enlace en tiempo de ejecución)
                </a>
            </p>
            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Complemento de información a los métodos del servicio de organización
                </span>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/gg328198.aspx" target="_blank">Métodos de servicio de organización
                </a>
            </p>
            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Uso del método Execute para la ejecución de mensajes
                </span>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/gg328075.aspx" target="_blank">Usar mensajes (clases de respuesta y solicitud) con el método Execute
                </a>
            </p>
            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Mensajes para el uso del método Execute
                </span>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/gg334698.aspx" target="_blank">Mensajes de xRM en el servicio de organización
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/gg309482.aspx" target="_blank">Mensajes de Dynamics 365 en el servicio de la organización
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/microsoft.xrm.sdk.messages.aspx" target="_blank">Espacio de nombres de Microsoft.Xrm.Sdk.Messages
                </a>
            </p>
            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Ejecutar múltiples mensajes con ExecuteMultiple
                </span>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/jj863631.aspx" target="_blank">Usar ExecuteMultiple para mejorar el rendimiento de la carga masiva de datos
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/jj863604.aspx" target="_blank">Ejemplo: ejecutar varias solicitudes
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/mt634414.aspx" target="_blank">Sample: Execute multiple requests in transaction
                </a>
            </p>
            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Uso de FetchXML
                </span>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-mx/library/gg328117.aspx" target="_blank">Usar FetchXML para crear una consulta
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-mx/library/gg328332.aspx" target="_blank">Crear consultas con FetchXML
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-mx/library/microsoft.crm.sdk.messages.fetchxmltoqueryexpressionrequest.aspx" target="_blank">FetchXmlToQueryExpressionRequest Class
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/hh547457.aspx" target="_blank">Ejemplo: convertir consultas entre Fetch y QueryExpression
                </a>
            </p>

            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Obtener multiple información relacionada a una entidad con LinkEntity
                </span>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/en-us/library/microsoft.xrm.sdk.query.linkentity.aspx" target="_blank">LinkEntity Class
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-mx/library/gg328149.aspx" target="_blank">Ejemplo: Recuperación múltiple con la clase de QueryExpression
                </a>
            </p>




            <%-- TEMA 3 - 3. Ensamblados (Extensiones para Dynamics CRM) --%>
            <h1 id="Tema3" class="titulo-tema-contenido">3. Ensamblados (Extensiones para Dynamics CRM)</h1>
            <p class="parrafo-contenido">
                En esta sección construiremos un Plugin y un Custom Workflow Activity para comprender mejor como es que funcionan estos elementos de Dynamics 365.
            </p>
            <p class="parrafo-contenido">
                Los ensamblados personalizados en Dynamics 365 son uno de los enfoques más utilizados y poderosos para extender la aplicación. 
                Un ensamblado para CRM es un código personalizado, escrito y compilado en .Net, que es "activado" cuando un evento específico tiene lugar dentro de una entidad de CRM especificada.                 
            </p>

            <p class="parrafo-contenido">
                El objetivo del código de ensamblado personalizado es mejorar o modificar las características/comportamiento estándar de CRM mediante la inyección de lógica empresarial personalizada 
                en la ejecución de casi cualquier tarea que realice un usuario en CRM.
            </p>
            <p>Si ocupa conocer más a fondo acerca del desarrollo de ensamblados (Plugins) Dynamics 365 puede ver la siguiente referencia:</p>
            <p><b>Referencia: </b><a href="https://msdn.microsoft.com/es-mx/library/gg328490.aspx" target="_blank">Desarrollo de complementos</a></p>






            <%-- 3.1 - Entendiendo los Plugins --%>
            <h3 id="EntendiendoPluginsCRM" class="titulo-subtema">3.1 - Entendiendo los Plugins<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                El código de un Plugin se puede ejecutar cuando se crea o actualiza un registro o tal vez incluso cuando se consulta un grupo de registros. 
                El sistema Microsoft Dynamics CRM contiene una amplia gama de estos eventos, comúnmente denominados "Mensajes" del sistema, desde los cuales se puede activar el código personalizado.                 
            </p>
            <p class="parrafo-contenido">
                Los mensajes (que técnicamente son operaciones de servicio web) están constantemente disponibles para ejecutarse mientras CRM reconoce los eventos dentro de la plataforma 
                y envía peticiones al mensaje respectivo para que la lógica personalizada interactúe con sus datos.
            </p>
            <p class="titulo-parrafo-contenido">
                Mensajes (Eventos)
            </p>
            <p class="parrafo-contenido">
                Aqui se presentan los mensajes más usados en Dynamics 365:
            </p>
            <ul>
                <li>Create</li>
                <li>Update</li>
                <li>Delete</li>
                <li>Retrieve</li>
                <li>RetrieveMultiple</li>
            </ul>
            <p class="parrafo-contenido">
                Si quiere conocer más mensajes puede ver el archivo <b>Message-entity support for plug-ins.xlsx</b> que se encuentra en la carpeta raíz del SDK.
            </p>
            <p class="titulo-parrafo-contenido">
                Pipeline de eventos
            </p>
            <p class="parrafo-contenido">
                El pipeline de eventos le permite configurar cuándo se debe de ejecutar el Plugin. El pipeline de eventos se divide en las siguientes etapas:
            </p>
            <ul>
                <li>
                    <b>Pre-validation:</b>
                </li>
            </ul>
            <p class="parrafo-contenido-steps">
                Esta etapa se ejecuta antes de cualquier otra cosa, incluso antes de la validación básica e incluso se ejecuta antes de la validación de seguridad.
                    
            </p>
            <p class="parrafo-contenido-steps">
                Por lo tanto, sería posible desencadenar el código del plugin incluso sin tener realmente permiso para hacerlo y se debe tener gran consideración al escribir un plug-in de validación previa. 
                    Además, la ejecución en esta etapa podría no ser parte de la transacción de la base de datos
            </p>
            <ul>
                <li>
                    <b>Pre-operation:</b>
                </li>
            </ul>
            <p class="parrafo-contenido-steps">
                Esta etapa se ejecuta después de la validación, pero antes de que los cambios se han comprometido a base de datos. Esta es una de las etapas más comúnmente usadas.                    
            </p>
            <ul>
                <li>
                    <b>Post-operation:</b>
                </li>
            </ul>
            <p class="parrafo-contenido-steps">
                Esta etapa se ejecuta después de que los cambios se han comprometido a base de datos. Esta es una de las etapas más utilizadas.                   
            </p>

            <p class="titulo-parrafo-contenido">
                Imágenes de Plugin (Entity Snapshots)
            </p>
            <p class="parrafo-contenido">
                Las imágenes de plugin son snapshots de los atributos de la entidad, antes o después de la operación realizada. 
            </p>
            <p class="parrafo-contenido">
                ¿Para que puedo usar una imagen de plugin?
            </p>
            <ul>
                <li>Principalmente podemos ver a una imagen de plugin como una forma de obtener la información de los atributos de una entidad sin tener que hacer una consulta extra a Dynamics CRM.</li>
                <li>Uno de los mejores usos para esto es en los plug-ins de actualización. Cabe mencionar que la entidad de destino(Target) del plugin de actualización sólo contiene 
                    los atributos actualizados. Sin embargo, a menudo el plug-in requerirá información de otros atributos. En lugar de realizar una consulta adicional a la entidad, 
                    la mejor práctica es especificar los datos necesarios en una imagen de plugin.</li>
                <li>Comparación de datos antes y después. Esto permite a un plugin de auditoría (Por ejemplo), que registre cuál era el valor antes y después o calcula el tiempo que se pasa en una etapa o estado.</li>
            </ul>
            <p class="parrafo-contenido">
                Estas son las formas de acceder a las imágnes de un plugin:
            </p>
            <ul>
                <li>Pre-Image:
                    <br />
                    <div class="ruta-steps">
                        Entity preImage = (Entity)context.PreEntityImages["[Nombre de Imagen]"];
                    </div>
                </li>
                <li>Post-Image:
                    <br />
                    <div class="ruta-steps">
                        Entity postImage = (Entity)context.PostEntityImages["[Nombre de Imagen]"];
                    </div>
                </li>
            </ul>
            <p class="parrafo-contenido">
                Para más información acerca de las imágenes de plugin vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://community.dynamics.com/crm/b/crmchap/archive/2016/08/21/utilising-pre-post-entity-images-in-a-dynamics-crm-plugin" target="_blank">Utilising Pre/Post Entity Images in a Dynamics CRM Plugin</a></b>
            </p>
            <p class="titulo-parrafo-contenido">
                Modo de ejecución
            </p>
            <p class="parrafo-contenido">
                A nivel general Dynamics 365 maneja dos tipos de ejecución en sus procesos, que tambien aplican a los plugins:
            </p>
            <ul>
                <li><b>Síncrono:</b> <br />
                    Los plugins síncronos son ejecutados por el sistema Core de CRM. La ejecución síncrona significa que el evento de disparo esperará hasta que el plug-in termine la ejecución. 
                    Por ejemplo, si tenemos un complemento síncrono que se activa en la creación de la cuenta y el usuario crea un registro de cuenta en CRM, el formulario se bloqueará hasta 
                    que el complemento haya finalizado.</li>
                <li><b>Asíncrono:</b> <br />
                    Los plugins asíncronos se ejecutan mediante el servicio de procesamiento asíncrono. Los complementos asíncronos permiten que el evento de activación termine antes de que se ejecute el código de complemento. 
                    Por lo tanto, éstos nunca se pueden usar para prevenir una acción, validar la entrada de datos o proporcionar ningún mensaje de error al usuario.</li>
            </ul>
            <p class="titulo-parrafo-contenido">
                Tipo de implementación
            </p>
            <p class="parrafo-contenido">
                Dynamics 365 tiene dos formas de implementar un plugin:
            </p>
            <ul>
                <li><b>Servidor:</b> <br />
                    Los plugins implementados en el servidor serán ejecutados únicamente en el servidor y desde los clientes que tengan una conexión activa al servidor.</li>
                <li><b>Fuera de linea (Offline):</b> <br />
                    A diferencia de plugins de servidor, estos se ejecutan en la aplicación cliente (Outlook) aún y cuando esta no tiene una conexión activa al servidor de Dynamics 365.</li>
            </ul>


            <%-- 3.2 - Construir un Plugin --%>
            <h3 id="ConstruirPluginCRM" class="titulo-subtema">3.2 - Construir un Plugin<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Para interectuar con Dynamics 365 desde un plugin es necesario llegar a obtener el servicio de la organización por medio del objeto <b>IOrganizationService</b> y este lo podemos obtener desde el código del plugin.
            </p>
            <p class="titulo-parrafo-contenido">
                Guía de construcción.
            </p>
            <p class="parrafo-contenido">
                Hay 9 pasos que debemos de tener como base para la ejecución correcta de un plugin.
            </p>
            <ol class="lista-codigo">
                <li>Implementar la interfaz <b>Microsoft.Xrm.Sdk.IPlugin</b> y su método <b>Execute(IServiceProvider serviceProvider)</b> a la clase del plugin.</li>
                <li>Obtener el servicio para trazado de ejecucion de código con: 
                    <div class="ruta-steps">ITracingService tracingService = (ITracingService)serviceProvider.GetService(typeof(ITracingService));</div>

                </li>
                <li>Obtener el contexto de ejecución del plugin con: 
                    <div class="ruta-steps">IPluginExecutionContext context = (IPluginExecutionContext)serviceProvider.GetService(typeof(IPluginExecutionContext));</div>

                </li>
                <li>Obtener la información del registro de entidad que ejecutó el plugin con: 
                    <div class="ruta-steps">Entity _entidadActual = (Entity)context.InputParameters["Target"];</div>

                </li>
                <li>Obtener la fábrica del servicio de organización con: 
                    <div class="ruta-steps">IOrganizationServiceFactory serviceFactory = (IOrganizationServiceFactory)serviceProvider.GetService(typeof(IOrganizationServiceFactory));</div>
                </li>
                <li>Obtener el servicio de organización con: 
                    <div class="ruta-steps">IOrganizationService _service = serviceFactory.CreateOrganizationService(context.UserId);</div>
                </li>
                <li>Impementar el bloque de código try-catch con <b>FaultException&lt;OrganizationServiceFault&gt; ex</b> agregando la referencia a <b>System.ServiceModel</b>.</li>
                <li>Impementar la lógica de negocio dentro del bloque de código try-catch.</li>
                <li>Tener firmada la biblioteca de clases.</li>
            </ol>
            <p class="parrafo-contenido">
                Para más información acerca de la contrucción de plugins, vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg328263.aspx" target="_blank">Construir un Plugin</a></b>
            </p>





            <%-- 3.3 - Registrar el Plugin en Dynamics CRM --%>
            <h3 id="RegistrarPluginCRM" class="titulo-subtema">3.3 - Registrar el Plugin en Dynamics CRM<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Para llevar a cabo el registro de plugins en Dynamics 365 es necesario utilizar la herramienta Plugin Registration Tool. Para más información
                de donde encontrar esta herramienta, vea la siguiente referencia: <b><a href="#pluginRegistrationTool" class="indice-link">3.7 - Herramienta Plugin Registration Tool</a></b>
                
            </p>
            <p class="titulo-parrafo-contenido">
                Utilizando Plugin Registration Tool
            </p>
            <p class="parrafo-contenido-steps">
                Una vez abierto y conectado el Plugin registration Tool a la organización donde queremeos registrar nuestro plugin, haremos lo siguiente:
            </p>
            <ol class="lista-contenido-steps">
                <li>
                    <p>
                        Dar clic al menú desplegable de la opción <b>Register</b> y seleccionar <b>Register New Assembly</b>
                    </p>
                    <p class="text-center">
                        <img src="../Images/7.RegistrarAssembly.png" />
                    </p>
                </li>
                <li>
                    <p>
                        Dar clic en los tres puntos suspensivos (...) para buscar la librería (dll) donde tenemos el plugin, seleccionar el plugin que queremos registrar (En nuestro caso el único) y dar clic en el botón <b>Register Selected plugins</b> .
                    </p>
                    <p class="text-center">
                        <img src="../Images/8.RegistrarAssembly2.png" />
                    </p>
                </li>
                <li>
                    <p>
                        Buscar y seleccionar el plugin que queremos asociarlo a un evento (Step), dar clic en el botón <b>Register</b> y seleccionar <b>Regsiter New Step</b>
                    </p>
                    <p class="text-center">
                        <img src="../Images/9.RegistrarAssembly3.png" />
                    </p>
                </li>
                <li>
                    <p>
                        Escribir el nombre del mensaje(Evento) al que queremos asociar el plugin, escribir la entidad a la que queremos asociar el evento y seleccionar las opciones de registro. 
                        Para más información acerca de las opciones de registro vea: <b><a href="#EntendiendoPluginsCRM" class="indice-link">3.1 - Entendiendo los Plugins</a></b>
                    </p>
                    <p class="text-center">
                        <img src="../Images/10.RegistrarAssembly4.png" />
                    </p>
                </li>
                <li>Dar clic en <b>Register New Step</b></li>
            </ol>
            <p>
                Para información adicional y consideraciones al momento de implementar un Plugin, vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg309620.aspx" target="_blank">Registrar e implementar complementos (Plugins)</a></b>
            </p>






            <%-- 3.4 - Entendiendo los Custom Workflow Activities (WA) --%>
            <h3 id="EntendiendoWACRM" class="titulo-subtema">3.4 - Entendiendo los Custom Workflow Activities (WA)<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                El código de un Custom Workflow Activity se puede ejecutar dentro de alguna actividad de flujo de trabajo, cuando el flujo de trabajo ha sido ejecutado. 
                Un Custom Workflow Activity no requiere de configuración adicional después de ser registrado, solo es necesario agregarlo a un flujo de trabajo, diálogo o acción para comenzar a utilizarlo.          
            </p>
            <p class="titulo-parrafo-contenido">
                Parámetros de entrda y salida
            </p>
            <p class="parrafo-contenido">
                A diferencia de un plugin, en un custom Workflow Activity es posible declarar parámetros de entrada, salida o Entrada/Salida y los parámetros se definen con 
                alguno de los siguientes tipos:
            </p>
            <ul>
                <li>InArgument</li>
                <li>OutArgument</li>
                <li>InOutArgument</li>
            </ul>
            <p class="parrafo-contenido">
                Pero es necesario asignarle atributos metadata a estos parámetros. Para ver como asignarles metadata a estos parámetros vea la siguiente referencia
            </p>            
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg327842(v=crm.5).aspx" target="_blank">Add Metadata to a Custom Workflow Activity</a></b>
            </p>
            



            <%-- 3.5 - Construir un Custom Workflow Activity --%>
            <h3 id="ConstruirWACRM" class="titulo-subtema">3.5 - Construir un Custom Workflow Activity<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Para interectuar con Dynamics 365 desde un custom workflow activity puede no ser necesario llegar a obtener el servicio de la organización por medio del objeto 
                <b>IOrganizationService</b> ya que podemos usar los parámetros de Entrada y Salida en los flujos de trabajo para interactuar con Dynamics 365.
            </p>
            <p class="parrafo-contenido">
                Para más información acerca de la contrucción de custom workflow activity, vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-mx/library/gg309745.aspx" target="_blank">Actividades de flujo de trabajo personalizadas (ensamblados de flujo de trabajo)</a></b>
            </p>
            <p class="titulo-parrafo-contenido">
                Guía de construcción.
            </p>
            <p class="parrafo-contenido">
                Hay 8 pasos que debemos de tener como base para la ejecución correcta de un plugin.
            </p>
            <ol class="lista-codigo">
                <li>Heredar la interfaz <b>System.Activities.CodeActivity</b> y sobre-escribir el método <b>Execute(CodeActivityContext executionContext)</b> e implementar nuestra propia lógica de negocio.</li>
                <li>Obtener el servicio para trazado de ejecucion de código con: 
                    <div class="ruta-steps">ITracingService tracingService = executionContext.GetExtension&lt;ITracingService&gt;();</div>

                </li>
                <li>Obtener el contexto de ejecución del workflow con: 
                    <div class="ruta-steps">IWorkflowContext context = executionContext.GetExtension&lt;IWorkflowContext&gt;();</div>

                </li>
                <li>Obtener la fábrica del servicio de organización con: 
                    <div class="ruta-steps">IOrganizationServiceFactory serviceFactory = executionContext.GetExtension&lt;IOrganizationServiceFactory&gt;();</div>
                </li>
                <li>Obtener el servicio de organización con: 
                    <div class="ruta-steps">IOrganizationService service = serviceFactory.CreateOrganizationService(context.UserId);</div>
                </li>
                <li>Impementar el bloque de código try-catch.</li>
                <li>Impementar la lógica de negocio dentro del bloque de código try-catch.</li>
                <li>Tener firmada la biblioteca de clases.</li>
            </ol>
            <p class="parrafo-contenido">
                Para más información acerca de la contrucción de custom workflow activity, vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-mx/library/gg334455.aspx" target="_blank">Ejemplo: crear una actividad de flujo de trabajo personalizada</a></b>
            </p>




            <%-- 3.6 - Registrar el Custom Workflow Activity en Dynamics CRM --%>
            <h3 id="RegistrarWACRM" class="titulo-subtema">3.6 - Registrar el Custom Workflow Activity en Dynamics CRM<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                El proceso de registro de un custom workflow activity es el mismo que el de un plugin hasta el paso 2, después de esto hay que hacer un paso adicional.
            </p>
            <p class="titulo-parrafo-contenido">
                Utilizando Plugin Registration Tool
            </p>
            <p class="parrafo-contenido-steps">
                Una vez abierto y conectado el Plugin registration Tool a la organización donde queremeos registrar nuestro custom workflow activity, haremos lo siguiente:
            </p>
            <ol class="lista-contenido-steps">
                <li>
                    <p>
                        Dar clic al menú desplegable de la opción <b>Register</b> y seleccionar <b>Register New Assembly</b>
                    </p>
                    <p class="text-center">
                        <img src="../Images/7.RegistrarAssembly.png" />
                    </p>
                </li>
                <li>
                    <p>
                        Dar clic en los tres puntos suspensivos (...) para buscar la librería (dll) donde tenemos el custom workflow activity, seleccionar el custom workflow activity que queremos registrar (En nuestro caso el único,además del plugin) y dar clic en el botón <b>Update Selected Plugins</b> dado que ya hemos registrado un plugin anteriormente en este mismo ensamblado.
                    </p>
                    <p class="text-center">
                        <img src="../Images/11.RegistrarAssembly5.png" />
                    </p>
                </li>
                <li>
                    <p>
                        Una vez registrado el custom workflow activity lo seleccionamos y damos clic en el tab <b>Properties</b> 
                        en la parte inferior de la ventana, cambiamos las propiedades <b>FriendlyName</b> y <b>Name</b> por alguno con el cual lo podamos identificar mejor y presionamos
                        el botón <b>Guardar</b>.
                    </p>
                    <p class="text-center">
                        <img src="../Images/12.RegistrarAssembly6.png" />
                    </p>
                </li>
            </ol>
            <p>
                Para información adicional y consideraciones al momento de implementar un custom workflow activity, vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg328153.aspx" target="_blank">Registrar y usar un ensamblado personalizado de actividad de flujo de trabajo</a></b>
            </p>



            <%-- 3.7 - Herramienta Plugin Registration Tool --%>
            <h3 id="pluginRegistrationTool" class="titulo-subtema">3.7 - Herramienta Plugin Registration Tool<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                La herramienta Plugin Registration Tool tiene varias funcionalidades que nos ayudan en el desarrollo de extensiones para Dynamics 365 dentro las que se encuentran:                     
            </p>
            <ul>
                <li>Conectarnos a una organización de Dynamics 365 Online u On-premises</li>
                <li>Autenticarse con una cuenta de Office 365 o de Active Directory</li>
                <li>Registrar o De-registrar uno o varios <b>Plugins</b></li>
                <li>Registrar o De-registrar Uno o varios <b>Steps</b> para un Plugin</li>
                <li>Registrar o De-registrar Uno o varios <b>Images</b> para un Plugin</li>
                <li>Registrar o De-registrar uno o varios <b>Custom Workflow Activities</b></li>
                <li>Ver o actualizar la metadata de un ensamblado, plugin, Step, Image o Workflow Activity</li>
                <li>Adjuntar el proceso de <b>Debug</b> para un plugin o Workflow Activity en Visual Studio</li>
            </ul>
            <p>
                Esta herramiente se encuentra en una carpeta dentro del SDK de desarrollo para Dynamics 365 y podemos encontrarla en la siguiente ruta:   
            </p>
            <div class="ruta">
                [Ruta de instalación SDK Dynamics 365]\SDK\Tools\PluginRegistration
            </div>
            <p>
                Para información adicional acerca del Plugin Registration Tool, vea la siguiente referencia:
            </p>
            <p>
                <b>Referencia: <a href="https://msdn.microsoft.com/es-es/library/gg309580.aspx" target="_blank">Tutorial: registrar un complemento mediante la herramienta de registro de complementos</a></b>     
            </p>


            <li><a href="#" class="indice-link"></a></li>


            <%-- 3.8 - Práctica --%>
            <h3 id="PracticaEnsambladosCRM" class="titulo-subtema">3.8 - Práctica<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Para practicar los ejercicios anteriores crearemos lo siguiente:
            </p>

            <p class="titulo-parrafo-contenido">
                Actividades
            </p>
            <p class="parrafo-contenido">
                Crear un Plugin con las siguientes especificaciones
            </p>
            <ul>
                <li>Se debe de ejecutar después de actualizar un contacto</li>
                <li>Leer el puesto del contacto</li>
                <li>Actualizar un campo de tipo OptionSet llamado TipoContacto y asignar el valor de acuerdo a las siguientes reglas:
                    <ol>
                        <li>Platino - Cuando el puesto contenga Director</li>
                        <li>Premium - Cuando el puesto contenga Gerente</li>
                        <li>Gold - Cuando el puesto sea cualquier otro</li>
                        <li>Pendiente - Cuando el puesto esté en blanco</li>
                    </ol>
                </li>
            </ul>
            <p class="parrafo-contenido">
                Crear un Workflow Activity con las siguientes especificaciones
            </p>
            <ul>
                <li>Se debe de ejecutar cuando se actualiza el campo TipoContacto de un Contacto</li>
                <li>Actualizar el campo límite de crédito y asignar el valor de acuerdo a las siguientes reglas:
                    <ol>
                        <li>70000.0 - Cuando el tipo de contacto sea Platino</li>
                        <li>45000.0 - Cuando el tipo de contacto sea Premium</li>
                        <li>25000.0 - Cuando el tipo de contacto sea Gold</li>
                        <li>0.0 - Cuando el tipo de contacto sea Pendiente</li>
                    </ol>
                </li>
            </ul>





            <%-- 3.9 - Complementos --%>
            <h3 id="EnsambladosComplementos" class="titulo-subtema">3.9 - Complementos<a href="#Temario"><i class='fa fa-angle-double-up boton-temario'></i></a></h3>
            <p class="parrafo-contenido">
                Las formas de interacción con Dynamics 365 presentadas en este curso no representan la totalidad de operaciones distintas que se pueden llevar a cabo en Dynamics 365,
                existen múltiples formas de llevar una acción por medio del SDK y cada una ayuda de forma distinta a resolver una necesidad para Dynamics 365.
            </p>
            <p class="parrafo-contenido">
                La intención de esta sección es dejar documentación de referencia a muchas otras formas de usar el SDK de Dynamics CRM.
            </p>
            <p class="titulo-parrafo-contenido">
                Referencias
            </p>
            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Información adicional relacionada a Pluging y Workflow Activities:
                </span>
                <br />
                <a class="link-referencia" href="http://crmbook.powerobjects.com/extending-crm/plug-in-development-and-workflow-extensions/" target="_blank">Plug-ins and Workflow Extensions
                </a>
            </p>
            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Acceso a un sitio web desde un Plugin (Espacio Aislado)
                </span>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/gg509030.aspx" target="_blank">Ejemplo: acceso web desde un complemento de espacio aislado
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-mx/library/gg334752.aspx" target="_blank">Aislamiento, relaciones de confianza y estadísticas de complementos
                </a>
            </p>
            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Uso de Imagenes Pre/Post de un plugin
                </span>
                <br />
                <a class="link-referencia" href="https://community.dynamics.com/crm/b/crmchap/archive/2016/08/21/utilising-pre-post-entity-images-in-a-dynamics-crm-plugin" target="_blank">Utilising Pre/Post Entity Images in a Dynamics CRM Plugin
                </a>
            </p>
            <p>
                <span class="titulo-referencia"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                    Debug de plugins y Custom Workflow Activities
                </span>
                <br />
                <a class="link-referencia" href="https://blogs.msdn.microsoft.com/devkeydet/2015/02/17/debug-crm-online-plugins/" target="_blank">Debug CRM Online Plugins
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-es/library/gg309482.aspx" target="_blank">Mensajes de Dynamics 365 en el servicio de la organización
                </a>
                <br />
                <a class="link-referencia" href="https://msdn.microsoft.com/es-mx/library/gg328574.aspx" target="_blank">Depurar un Plugin On-premises
                </a>
                <br />
                <a class="link-referencia" href="https://dreamingincrm.com/2016/02/26/debugging-custom-workflow-assemblies/" target="_blank">Debugging custom workflow assemblies
                </a>
                <br />
                <a class="link-referencia" href="https://weblogs.asp.net/pabloperalta/how-to-remote-debug-dynamics-crm-plugins-and-workflow-assemblies" target="_blank">Step by step: How to remote debug Dynamics CRM plugins and workflow assemblies
                </a>
            </p>

        </form>
    </div>
    <script src="../Scripts/jquery-3.2.1.min.js"></script>
    <script src="../Scripts/bootstrap.js"></script>
    <script>
</script>
</body>
</html>
