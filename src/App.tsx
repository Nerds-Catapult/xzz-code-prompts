// import React from "react";
// import { app, Menu } from "electron";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Welcomescreen from "./screens/Welcomescreen.tsx";
import Homepage from "./screens/Home/Homepage.tsx";
import Inventorypage from "./screens/Home/Inventorypage.tsx";

function App() {

  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Welcomescreen />} />
        <Route path="/home" element={<Homepage />} />
        <Route path="/inventory" element={<Inventorypage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
