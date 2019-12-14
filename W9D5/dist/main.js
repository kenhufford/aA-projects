/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DomNodeCollection{\n  constructor(elements){\n    this.elements = elements;\n    // console.dir(this.elements);\n  }\n\n  children(){\n    let children = [];\n\n    this.elements.forEach((ele) => {\n      for (let i = 0; i < ele.children.length; i++){\n        children.push(ele.children[i]);\n      }\n    });\n\n    return new DomNodeCollection(children);\n  }\n\n  parent(){\n    let parents = [];\n\n    this.elements.forEach((ele) => {\n        parents.push(ele.parentElement);\n    });\n    \n\n    return new DomNodeCollection(parents.uniq());  \n  }\n\n  find(target){\n    // console.log(this);\n    let nodes= this.children();\n    let results = [];\n    // console.log(this.elements);\n    this.elements.forEach((ele) => {\n      for(let i=0; i < nodes.children().length; i++){\n        if (nodes.children().getAttribute() === target){\n          \n        }\n      }\n      console.log(ele);\n      let array_ele = Array.from(ele);\n      let dom_ele = new DomNodeCollection(array_ele);\n      debugger;\n      if (dom_ele.children().getAttribute()){}\n      results.push(dom_ele.children().querySelectorAll(target));\n    });\n    return new DomNodeCollection(results);\n  }\n\n  html(string){\n\n    if (!string){\n      return this.elements[0].innerHTML;\n    }\n\n    this.elements.forEach( (ele) =>{\n      ele.innerHTML = string;\n    });\n  }\n\n  empty(){\n    this.elements.forEach((ele) => {\n      ele.innerHTML = \"\";\n    });\n  }\n\n  append(string){\n    this.elements.forEach((ele) => {\n      // console.dir(ele);\n      ele.innerHTML += string;\n    });\n  }\n\n  attr(attrName, value){\n    if (!value){\n      this.elements.forEach((ele) => {\n        return ele.getAttribute(attrName);\n      });\n    }\n    this.elements.forEach((ele) => {\n      ele.setAttribute(attrName, value);\n    });\n  }\n\n  addClass(value) {\n    this.elements.forEach((ele) => {\n      ele.setAttribute(\"class\", value);\n    });\n  }\n\n  removeClass(value) {\n    this.elements.forEach((ele) => {\n      ele.classList.remove(value);\n    });\n  }\n}\n\nmodule.exports = DomNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DomNodeCollection = __webpack_require__ (/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nfunction $l(query){\n  if (query instanceof HTMLElement){\n    return new DomNodeCollection([query]);\n  } else {\n    let elements = document.querySelectorAll(query);\n    let array = Array.from(elements);\n    return new DomNodeCollection(array);\n  } \n}\n\nwindow.$l = $l;\n\n$(() => {\n  // console.log(window.$l(\"div\"));\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });