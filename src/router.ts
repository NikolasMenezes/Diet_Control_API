import express from "express";
import { userMiddleware } from './middleware/userMiddleware'
import { userController } from "./controller/userController";
import { userBasicInfoController } from "./controller/userBasicInfoController";
import { loginController } from "./controller/loginController";
import { jwtValidationMiddleware } from "./middleware/jwtValidatorMiddleware";
import { foodGenericsController } from "./controller/foodGenericsController";
import { validateSentGroup } from "./middleware/foodGenerecisMiddleware";
import { verifyUserBasicInfoFields } from "./middleware/userBasicInfoMiddleware";
import { mealController } from "./controller/mealController";
import { verifyMealFields } from "./middleware/mealsMiddleware";

const router = express.Router()

// User
router.get('/user/all', jwtValidationMiddleware, userController.getUsers)
router.get('/user/:id', jwtValidationMiddleware, userController.getUserById)
router.post('/user', userMiddleware, userController.postUser)
router.patch('/user/:id', jwtValidationMiddleware, userController.updateUser)
router.delete('/user/:id', jwtValidationMiddleware, userController.deleteUser)

// User Basic informations
router.get('/user/info/:id', jwtValidationMiddleware, userBasicInfoController.getUserBasicInfo)
router.post('/user/info/:id', jwtValidationMiddleware, verifyUserBasicInfoFields, userBasicInfoController.storeUserBasics)
router.patch('/user/info/:id', jwtValidationMiddleware, userBasicInfoController.updateUserBasicInfo)

// Login
router.post('/login', loginController.login)

// Food Generics
router.get("/food/all", jwtValidationMiddleware, foodGenericsController.getAll)
router.get("/food", jwtValidationMiddleware, validateSentGroup, foodGenericsController.getByGroup)
router.get("/food/:id", jwtValidationMiddleware, validateSentGroup, foodGenericsController.getById)

// Meals 
router.get("/meal/user", jwtValidationMiddleware, mealController.getMealsUserId);
router.get("/meal/:id", jwtValidationMiddleware, mealController.getMealById);
router.post("/meal", jwtValidationMiddleware, verifyMealFields, mealController.postMeal)
router.post("/meal/:id/food", jwtValidationMiddleware, mealController.addFoodToMeal)
router.put("/meal/:id", jwtValidationMiddleware, verifyMealFields, mealController.putMeal)
router.delete("/meal/:id", jwtValidationMiddleware, mealController.deleteMealById)
router.delete("/meal/:meal_id/food/:food_id", jwtValidationMiddleware, mealController.deleteFoodFromMeal)

export default router