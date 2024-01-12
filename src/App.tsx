import { useState } from "react";
import reactLogo from "./assets/react.svg";
import viteLogo from "/electron-vite.animate.svg";

import { twMerge } from "tailwind-merge";

function App() {
  const [count, setCount] = useState(0);
  const [openNDC, setOpenNDC] = useState<boolean>(false);

  return (
    <div className={twMerge("bg-gray-100/40 h-screen w-screen")}>
      <h1 className="text-center">Super-supa</h1>
    </div>
  );
}

export default App;
