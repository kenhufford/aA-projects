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

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__ (/*! ./util.js */ \"./src/util.js\");\nconst Ship = __webpack_require__ (/*! ./ship.js */ \"./src/ship.js\");\nconst Bullet = __webpack_require__ (/*! ./bullet.js */ \"./src/bullet.js\");\nconst MovingObject = __webpack_require__ (/*! ./moving_object.js */ \"./src/moving_object.js\");\n\n\nfunction Asteroid(position, game){\n  const COLOR = \"#00d9ff\";\n  const RADIUS = 30;\n  let options = {\n    pos : position,\n    vel : Util.randomVec(5),\n    radius : RADIUS,\n    color : COLOR,\n    gameInstance: game\n  };\n  MovingObject.call(this, options);\n}\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function (otherObject) {\n  if (otherObject instanceof Ship) {\n    // debugger;\n    otherObject.relocate();\n  } else if (otherObject instanceof Bullet) {\n    this.game.score += 1;\n    console.log(this.game.score);\n    this.game.remove(this, otherObject);\n  } else {\n    this.game.remove(this, otherObject);\n  }\n};\n\n\n\nmodule.exports = Asteroid;\nlet bob = Asteroid.prototype.collideWith;\nmodule.exports.collideWith = bob;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nfunction Bullet(direction, position, game){\n  let velocity = [direction[0] * 5, direction[1] * 5];\n  const COLOR = \"#0dff00\";\n  const RADIUS = 5;\n  let options = {\n    pos: position,\n    vel: velocity,\n    radius: RADIUS,\n    color: COLOR,\n    gameInstance: game\n  };\n  MovingObject.call(this, options);\n}\n\nUtil.inherits(Bullet, MovingObject);\n\n\nBullet.prototype.isWrappable = false;\n\nmodule.exports = Bullet;\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\n\nfunction Game(){\n  this.DIM_X = 800;\n  this.DIM_Y = 600;\n  this.NUM_ASTEROIDS = 30;\n  this.asteroids = [];\n  this.bullets = [];\n  this.score = 0;\n  this.addAsteroids();\n  this.ship = new Ship(this.randomPosition(), this);\n}\n\nGame.prototype.addAsteroids = function(){\n  while (this.asteroids.length < this.NUM_ASTEROIDS) {\n    let that = this;\n    this.asteroids.push(new Asteroid(this.randomPosition(), this));\n  }\n};\n\nGame.prototype.randomPosition = function(){\n  let x = Math.floor(Math.random() * this.DIM_X);\n  let y = Math.floor(Math.random() * this.DIM_Y);\n  return [x,y];\n};\n\nGame.prototype.draw = function(ctx,img){\n  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);\n  img.onload();\n  let objectArray = this.allObjects();\n  objectArray.forEach( (object) => object.draw(ctx));\n};\n\nGame.prototype.moveObjects = function(){\n  let objectArray = this.allObjects();\n  objectArray.forEach((object) => object.move());\n};\n\nGame.prototype.wrap = function(pos){\n  let x = pos[0];\n  let y = pos[1];\n  if (x > this.DIM_X) x = 0;\n  if (x < 0) x = this.DIM_X;\n  if (y > this.DIM_Y) y = 0;\n  if (y < 0) y = this.DIM_Y;\n  return [x,y];\n};\n\nGame.prototype.checkCollisions = function(){\n  let objects = this.allObjects();\n  \n  for (let i = 0; i < objects.length; i++){\n    for (let j = i+1; j < objects.length; j++) {\n      if (objects[i].isCollidedWith(objects[j])){\n        objects[i].collideWith(objects[j]);\n      }\n    }\n  }\n};\n\nGame.prototype.step = function(){\n  this.moveObjects();\n  this.checkCollisions();\n};\n\nGame.prototype.remove = function(){\n  for (let i = 0; i < arguments.length; i++){\n    if (arguments[i] instanceof Asteroid){\n      let index = this.asteroids.indexOf(arguments[i]);\n      this.asteroids.splice(index, 1);\n    } else {\n      let index = this.bullets.indexOf(arguments[i]);\n      this.bullets.splice(index, 1);\n    }\n  }\n};\n\nGame.prototype.allObjects = function(){\n  let objects = this.asteroids.concat([this.ship], this.bullets);\n  return objects;\n}\n\nGame.prototype.isOutOfBounds = function(pos){\n  let x = pos[0];\n  let y = pos[1];\n  if (x > this.DIM_X) return true;\n  if (x < 0) return true;\n  if (y > this.DIM_Y) return true;\n  if (y < 0) return true;\n  return false;\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__ (/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx, img){\n  this.game = new Game();\n  this.ctx = ctx;\n  this.bindKeyHandlers();\n  this.img = img;\n}\n\nGameView.prototype.start = function(){\n  let that = this;\n  \n  setInterval(function() { \n    that.game.step(); \n    that.game.draw(that.ctx, that.img);\n  }, \n  20);\n};\n\nGameView.prototype.bindKeyHandlers = function(){\n  let that = this;\n  key('8', function () {\n    that.game.ship.power([0,-1]);\n  });\n  key('2', function () {\n    that.game.ship.power([0, 1]);\n  });\n  key('4', function () {\n    that.game.ship.power([-1,0]);\n  });\n  key('6', function () {\n    that.game.ship.power([1,0]);\n  });\n  key('9', function () {\n    that.game.ship.power([1,-1]);\n  });\n  key('7', function () {\n    that.game.ship.power([-1, -1]);\n  });\n  key('3', function () {\n    that.game.ship.power([1,1]);\n  });\n  key('1', function () {\n    that.game.ship.power([-1,1]);\n  });\n  key('space', function () {\n    that.game.ship.fireBullet();\n  });\n// key.bind('down', Ship.power([-1, 0]));\n// key.bind('left', Ship.power([0, -1]));\n// key.bind('right', Ship.power([0, 1]));\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("console.log(\"Webpack is working!\");\nconst MovingObject = __webpack_require__ (/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__ (/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__ (/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__ (/*! ./game_view.js */ \"./src/game_view.js\");\n\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Game = Game;\nwindow.GameView = GameView;\n\n\n\nwindow.addEventListener('DOMContentLoaded', () => {\n  let c = document.getElementById(\"game-canvas\");\n  let ctx = c.getContext(\"2d\");\n  const img = new Image();\n  img.onload = function () {\n    ctx.drawImage(img, 0, 0);\n  };\n  img.src = \"myImage.jpg\";\n  let gameView = new GameView(ctx, img);\n  gameView.start();\n});\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options){\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.gameInstance;\n}\n\nMovingObject.prototype.isWrappable = true;\n\nMovingObject.prototype.draw = function (ctx){\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n  ctx.stroke();\n  ctx.fillStyle = this.color;\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function() {\n  let x = this.vel[0];\n  let y = this.vel[1];\n  let xy = [this.pos[0] + x, this.pos[1] + y];\n  if (this.game.isOutOfBounds(xy)) {\n    if (this.isWrappable){\n      this.pos = this.game.wrap(xy);\n      return this.pos;\n    } else {\n      this.game.remove(this);\n    }\n  }\n  this.pos = xy;\n};\n\nMovingObject.prototype.isCollidedWith = function(otherObject){\n  let x1 = this.pos[0];\n  let x2 = otherObject.pos[0];\n  let y1 = this.pos[1];\n  let y2 = otherObject.pos[1];\n  \n  let distance = Math.sqrt(Math.pow((x2 - x1), 2) + Math.pow((y2 - y1), 2));\n  return (distance < this.radius + otherObject.radius) ? true : false;\n};\n\nMovingObject.prototype.collideWith = function (otherObject) {\n  // this.game.remove(this, otherObject);\n};\n\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Bullet = __webpack_require__(/*! ./bullet.js */ \"./src/bullet.js\");\n\nfunction Ship(position, game){\n  const COLOR = \"#ff05ea\";\n  const RADIUS = 10;\n  let options = {\n    pos: position,\n    vel: [0,0],\n    radius: RADIUS,\n    color: COLOR,\n    gameInstance: game\n  };  \n  MovingObject.call(this, options);\n}\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function(){\n  this.pos = this.game.randomPosition();\n  this.vel = [0,0];\n}\n\nShip.prototype.power = function(impulse){\n  let x = this.vel[0];\n  let y = this.vel[1];\n  this.vel = [impulse[0] + x, impulse[1] + y];\n}\n\nShip.prototype.fireBullet = function(){\n  let bullet = new Bullet(this.vel, this.pos, this.game);\n  this.game.bullets.push(bullet);\n}\n\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    function Surrogate(){\n\n    }\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });