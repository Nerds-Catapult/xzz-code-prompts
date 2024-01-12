import React from "react";

export default function Welcomescreen() {
  return (
    <>
      <div className="w-screen h-screen flex flex-col items-center justify-center">
        <h1 className="text-black text-4xl font-bold">Super Supa</h1>
        <div className="flex flex-col w-[50%]">
          <button className="rounded active:bg-gray-400 hover:bg-gray-300 p-2 bg-gray-200 h-14">
            Log in
          </button>
        </div>
      </div>
    </>
  );
}
