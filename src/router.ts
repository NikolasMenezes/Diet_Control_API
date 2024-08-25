import express from 'express';
import { userMiddleware } from './middleware/user.middleware';
import { userController } from './modules/user/user.controller';
import { userBasicInfoController } from './modules/user-info/user-basic-info.controller';
import { loginController } from './modules/auth/auth.controller';
import { jwtValidationMiddleware } from './middleware/jwt.middleware';
import { foodGenericsController } from './modules/food-generics/food-generics.controller';
import { validateSentGroup } from './middleware/food-generics.middleware';
import { verifyUserBasicInfoFields } from './middleware/user-basic-info.middleware';
import { mealController } from './modules/meal/meal.controller';
import { verifyMealFields } from './middleware/meals.middleware';

const router = express.Router();

// User
router.get('/user', jwtValidationMiddleware, userController.getUserInfo);
router.get('/user/all', jwtValidationMiddleware, userController.getUsers);
router.get('/user/:id', jwtValidationMiddleware, userController.getUserById);
router.post('/user', userMiddleware, userController.postUser);
router.patch('/user/:id', jwtValidationMiddleware, userController.updateUser);
router.delete('/user/:id', jwtValidationMiddleware, userController.deleteUser);

// User Basic informations
router.get(
  '/user/info/:id',
  jwtValidationMiddleware,
  userBasicInfoController.getUserBasicInfo,
);
router.post(
  '/user/info/:id',
  jwtValidationMiddleware,
  verifyUserBasicInfoFields,
  userBasicInfoController.storeUserBasics,
);
router.patch(
  '/user/info/:id',
  jwtValidationMiddleware,
  userBasicInfoController.updateUserBasicInfo,
);

// Login
router.post('/login', loginController.login);

// Food Generics
router.get('/food/all', jwtValidationMiddleware, foodGenericsController.getAll);
router.get(
  '/food',
  jwtValidationMiddleware,
  validateSentGroup,
  foodGenericsController.getByGroup,
);
router.get(
  '/food/:id',
  jwtValidationMiddleware,
  validateSentGroup,
  foodGenericsController.getById,
);

// Meals
router.get(
  '/meal/user',
  jwtValidationMiddleware,
  mealController.getMealsUserId,
);
router.get('/meal/:id', jwtValidationMiddleware, mealController.getMealById);
router.post(
  '/meal',
  jwtValidationMiddleware,
  verifyMealFields,
  mealController.postMeal,
);
router.post(
  '/meal/:id/food',
  jwtValidationMiddleware,
  mealController.addFoodToMeal,
);
router.put(
  '/meal/:id',
  jwtValidationMiddleware,
  verifyMealFields,
  mealController.putMeal,
);
router.delete(
  '/meal/:id',
  jwtValidationMiddleware,
  mealController.deleteMealById,
);
router.delete(
  '/meal/:meal_id/food/:food_id',
  jwtValidationMiddleware,
  mealController.deleteFoodFromMeal,
);

export { router };
