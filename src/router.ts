import express from "express";
import { userMiddleware } from './middleware/userMiddleware'
import { userController } from "./controller/userController";
import { basicsController } from "./controller/basicsController";
import { loginController } from "./controller/loginController";
import { jwtValidationMiddleware } from "./middleware/jwtValidatorMiddleware";
import { foodGenericsController } from "./controller/foodGenericsController";
import { validateSentGroup } from "./middleware/foodGenerecisMiddleware";
import { verifyUserBasicInfoFields } from "./middleware/userBasicInfoMiddleware";
import { mealController } from "./controller/mealController";
import { verifyMealFields } from "./middleware/mealsMiddleware";

const router = express.Router()

// User
router.get('/user/all', userController.getUsers)
router.get('/user/:id', userController.getUserById)
router.post('/user', userMiddleware, userController.postUser)
router.put('/user/:id', userMiddleware, userController.putUser)
router.delete('/user/:id', userController.deleteUser)

// User Basic informations
router.get('/user/info/:id', jwtValidationMiddleware, basicsController.getUserBasics)
router.post('/user/info/:id', jwtValidationMiddleware, verifyUserBasicInfoFields, basicsController.storeUserBasics)
router.put('/user/info/:id', jwtValidationMiddleware, verifyUserBasicInfoFields, basicsController.putUserBasics)

// Login
router.post('/login', loginController.authenticate)

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