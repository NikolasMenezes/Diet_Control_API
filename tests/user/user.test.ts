import request from "supertest";
import app from "../../src/app";

import { generateRandomString } from "../../src/utils/utils";

describe("Test all success cases for User endpoints", () => {

  it("Should return status 201 from POST /api/user", async () => {
    const user = {
      name: "Ashley Graham",
      password: "admin",
      email: generateRandomString() + "@gmail.com",
      isPremium: false,
    };

    const response = await request(app).post("/api/user").send(user);

    expect(response.status).toBe(201);
  });

  it("Should return status 200 from GET /api/user", async () => {
    const response = await request(app).get("/api/user");

    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty("id")
  });

  it("Should return status 200 from GET /api/user/:id", async () => {
    const response = await request(app).get("/api/user/1");

    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty("id")
  });

  it('Should return status 200 from PUT /api/user/:id', async ()=> {
    const user = {
      name: "Ashley Graham",
      password: "admin",
      email: "ashley@gmail.com",
      isPremium: true,
    };

    const response = await request(app).put("/api/user/3").send(user);

    expect(response.status).toBe(200);
  })

});

describe("Test all errors cases from User endpoints", () => {

  it("Should return status 400 from POST /api/user", async () => {
    const user = {
      name: "Ashley Graham",
      password: "admin",
      email: "ashley@gmail.com",
      isPremium: false,
    };

    const response = await request(app).post("/api/user").send(user);

    expect(response.status).toBe(400);
    expect(response.body).toHaveProperty('error')
  })

  it('Should return status 400 from PUT /api/user/:id', async ()=> {
    const user = {
      name: "Ashley Graham",
      password: "admin",
      email: "ashley@gmail.com",
      isPremium: true,
    };

    const response = await request(app).put("/api/user/10000").send(user);

    expect(response.status).toBe(400);
  })
})
