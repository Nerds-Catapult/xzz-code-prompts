import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/electron-vite.animate.svg";
import { twMerge } from "tailwind-merge";
import Welcomescreen from "./screens/Welcomescreen.tsx";

function App() {
  const [count, setCount] = useState(0);
  const [openNDC, setOpenNDC] = useState<boolean>(false);

  return (
    <>
      <Welcomescreen />
    </>
  );
}

export default App;
