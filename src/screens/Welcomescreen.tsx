import React, { useState, useEffect } from "react";
import CheckoutImage from "../assets/checkoutImage.png";
import { ipcRenderer } from "electron";
import { useNavigate } from "react-router-dom";



// import { FieldError, UseFormRegister } from "react-hook-form";
// import { twMerge } from "tailwind-merge";

type FormData = {
  username: string;
  password: string
}

export default function Welcomescreen() {
  const navigate = useNavigate();

  const [username, setUsername] = useState<string>("");
  const [password, setPassword] = useState<string>("");

  const loginUser = () => {

    if (username && password) {
      new Notification("Successfull", {
        body: "you have been logged in"
      })
      setPassword("");
      setUsername("");
      navigate("/home")
    } else {
      alert("you have to fill in your username and password")
    }

  };

  return (
    <>
      <div className="w-screen h-screen flex flex-row items-center justify-between font-primary">
        <div className="h-full w-[50%] bg-[#2D57EB] flex-col flex items-center justify-center">
          <img src={CheckoutImage} className="w-[60%]" alt="Checkout" />
          <h1 className="text-light text-[#6D88E7] text-sm tracking-wider">
            Product of <span className="text-gray-200">Nerds Catapult</span>
          </h1>
        </div>
        <div className="h-full w-[50%] bg-gray-200 flex flex-col items-center justify-center space-y-4">
          <h1 className="text-4xl font-bold text-black">Welcome back!</h1>
          <div className="w-[70%] space-y-4 flex flex-col items-center">
            <input
              onChange={(e) => setUsername(e.target.value)}
              value={username}
              className="w-80 p-2 h-14 bg-gray-100 rounded font-light"
              type="text"
              placeholder="username"
            />
            <input
              onChange={(e) => setPassword(e.target.value)}
              value={password}
              className="w-80 p-2 h-14 bg-gray-100 rounded font-light"
              type="password"
              placeholder="password"
            />
            <button
              id="login"
              onClick={loginUser}
              className="bg-[#2D57EB] p-2 h-14 w-40 text-white rounded hover:bg-[#6D88E7] active:bg-[#2E3242]"
            >
              {/* <a href="/home">log in</a> */}
              log in
            </button>
          </div>
        </div>
      </div>
    </>
  );
}