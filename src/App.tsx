// import React from "react";
// import { app, Menu } from "electron";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Welcomescreen from "./screens/Welcomescreen.tsx";
import Homepage from "./screens/Home/Homepage.tsx";

function App() {

  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Welcomescreen />} />
        <Route path="/home" element={<Homepage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
