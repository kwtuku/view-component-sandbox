// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import ComponentController from "./component_controller"
application.register("component", ComponentController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MultipleSelectController from "./multiple_select_controller"
application.register("multiple-select", MultipleSelectController)

import SortableListController from "./sortable_list_controller"
application.register("sortable-list", SortableListController)

import TippyDropdownController from "./tippy_dropdown_controller"
application.register("tippy-dropdown", TippyDropdownController)
