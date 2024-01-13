import express from "express";
import { userMiddleware } from './middleware/userMiddleware'
import { userController } from "./controller/userController";
import { basicsController } from "./controller/basicsController";
import { loginController } from "./controller/loginController";
import { jwtValidationMiddleware } from "./middleware/jwtValidatorMiddleware";
import { foodGenericsController } from "./controller/foodGenericsController";
import { validateSentGroup } from "./middleware/foodGenerecisMiddleware";

const router = express.Router()

// User
router.get('/user/all', userController.getUsers)
router.get('/user/:id', userController.getUserById)
router.post('/user', userMiddleware, userController.postUser)
router.put('/user/:id', userMiddleware, userController.putUser)
router.delete('/user/:id', userController.deleteUser)

// User Basic informations
router.get('/user/info/:id', basicsController.getUserBasics)
router.post('/user/info/:id', basicsController.storeUserBasics)
router.put('/user/info/:id', basicsController.putUserBasics)

// Login
router.post('/login', loginController.authenticate)

// Food Generics
router.get("/food/all", jwtValidationMiddleware, foodGenericsController.getAll)
router.get("/food", jwtValidationMiddleware, validateSentGroup, foodGenericsController.getByGroup)


export default router