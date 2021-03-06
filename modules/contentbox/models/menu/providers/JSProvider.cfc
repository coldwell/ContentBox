/**
********************************************************************************
ContentBox - A Modular Content Platform
Copyright 2012 by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Luis Majano and Ortus Solutions,Corp] 

Licensed under the Apache License, Version 2.0 (the "License" );
you may not use this file except in compliance with the License. 
You may obtain a copy of the License at 

http://www.apache.org/licenses/LICENSE-2.0 

Unless required by applicable law or agreed to in writing, software 
distributed under the License is distributed on an "AS IS" BASIS, 
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
See the License for the specific language governing permissions and 
limitations under the License.
********************************************************************************
 * Provider for JavaScript-type menu items
 */
component implements="contentbox.models.menu.providers.IMenuItemProvider" extends="contentbox.models.menu.providers.BaseProvider" accessors=true {

    /**
     * Constructor
     */
    public JSProvider function init() {
        setName( "JS" );
        setType( "JS" );
        setIconClass( "fa fa-code" );
        setEntityName( "cbJSMenuItem" );
        setDescription( "A menu item which executes JavaScript code" );
        return this;
    }
    /**
     * Retrieves template for use in admin screens for this type of menu item provider
     * @menuItem.hint The menu item object
     * @options.hint Additional arguments to be used in the method
     */ 
    public string function getAdminTemplate( required any menuItem, required struct options={} ) {
        var viewArgs = { menuItem=arguments.menuItem };
        return renderer.get().renderView( 
            view="menus/providers/js/admin", 
            module="contentbox-admin",
            args = viewArgs
        );
    }

    /**
     * Retrieves template for use in rendering menu item on the site
     * @menuItem.hint The menu item object
     * @options.hint Additional arguments to be used in the method
     */ 
    public string function getDisplayTemplate( required any menuItem, required struct options={} ) {
        var viewArgs = {
            menuItem=arguments.menuItem
        };
        return renderer.get().renderExternalView( 
            view="/contentbox/models/menu/views/js/display",
            module="contentbox",
            args = viewArgs
        );
    }
}