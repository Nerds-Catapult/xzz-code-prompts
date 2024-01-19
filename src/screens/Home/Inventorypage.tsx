import React from 'react'
import { useNavigate } from "react-router-dom";


export default function Homepage() {
  const navigate = useNavigate();
  const containerRef = React.useRef();

  const stockHistory = [
    {
      "timestamp": "2024-01-18",
      "stock": 100,
      "category": "Clothing"
    },
    {
      "timestamp": "2024-01-18",
      "stock": 150,
      "category": "Snacks"
    },
    {
      "timestamp": "2024-01-18",
      "stock": 75,
      "category": "Cooking Oil"
    },
    {
      "timestamp": "2024-01-18",
      "stock": 200,
      "category": "Flour"
    },
    {
      "timestamp": "2024-01-18",
      "stock": 50,
      "category": "Stationary"
    },
    {
      "timestamp": "2024-01-18",
      "stock": 120,
      "category": "House Appliances"
    },
    {
      "timestamp": "2024-01-18",
      "stock": 80,
      "category": "Drinks"
    },
    {
      "timestamp": "2024-01-18",
      "stock": 180,
      "category": "Fruits"
    }
  ]

  function downloadHistoryData() {

    const scale = 10;
    const container = containerRef.current;

    if (container) {
      console.log("Downloading")
    } else {

    }

  }

  return (
    <>
      <div className="flex flex-row w-screen h-screen bg-gray-100 font-primary">
        <div className="h-full bg-gray-100 flex flex-col items-center justify-between p-4">
          <div className="w-full flex flex-col space-y-4 items-center">
            <button onClick={() => navigate("/home")} className="p-2 w-20 h-20 bg-gray-200 font-semibold rounded"></button>
            <button onClick={() => navigate("/home")} className="p-2 w-20 h-20 bg-gray-200 font-semibold rounded"></button>
            <button onClick={() => navigate("/home")} className="p-2 w-20 h-20 bg-gray-200 font-semibold rounded"></button>
            <button onClick={() => navigate("/home")} className="p-2 w-20 h-20 bg-gray-200 font-semibold rounded"></button>
            <button onClick={() => navigate("/home")} className="p-2 w-20 h-20 bg-gray-200 font-semibold rounded"></button>
            <button onClick={() => navigate("/home")} className="p-2 w-20 h-20 bg-gray-200 font-semibold rounded"></button>
          </div>
          <button onClick={() => navigate("/home")} className="p-2 w-20 h-20 bg-red-600 font-semibold rounded"></button>
        </div>
        <div className="w-full h-full bg-gray-200 p-4 space-y-2">
          <div className="w-full h-20 flex items-center justify-between ">
            <div className='flex flex-col'>
              <h1 className='font-bold'>Super Market Name</h1>
              <h1>Admin Name</h1>
            </div>
            <div className="flex flex-row">
              <input className="h-12 p-2 rounded-l pl-4 w-80" type="text" placeholder="search for product(s)" />
              <button className="bg-black h-12 p-2 text-white w-20 rounded-r" type="submit">search</button>
            </div>
          </div>
          <div className="w-full overflow-x-auto">
            <div className="flex space-x-4 overflow-hidden">
              <button className="hover:bg-gray-200 hover:shadow active:bg-gray-300 p-2 h-12 bg-gray-100 rounded w-36 text-sm flex-shrink-0">Clothing</button>
              <button className="hover:bg-gray-200 hover:shadow active:bg-gray-300 p-2 h-12 bg-gray-100 rounded w-36 text-sm flex-shrink-0">Snacks</button>
              <button className="hover:bg-gray-200 hover:shadow active:bg-gray-300 p-2 h-12 bg-gray-100 rounded w-36 text-sm flex-shrink-0">Cooking Oil</button>
              <button className="hover:bg-gray-200 hover:shadow active:bg-gray-300 p-2 h-12 bg-gray-100 rounded w-36 text-sm flex-shrink-0">Stationary</button>
              <button className="hover:bg-gray-200 hover:shadow active:bg-gray-300 p-2 h-12 bg-gray-100 rounded w-36 text-sm flex-shrink-0">House Appliances</button>
              <button className="hover:bg-gray-200 hover:shadow active:bg-gray-300 p-2 h-12 bg-gray-100 rounded w-36 text-sm flex-shrink-0">Drinks</button>
              <button className="hover:bg-gray-200 hover:shadow active:bg-gray-300 p-2 h-12 bg-gray-100 rounded w-36 text-sm flex-shrink-0">Fruits</button>
            </div>
          </div>

          <div className="h-[88%] flex flex-col items-center space-x-2 space-y-2 p-4">
            <div className='w-full flex flex-row items-center justify-between'>
              <div className='rounded w-[49.5%] h-80 bg-gray-100 animate-pulse flex items-center justify-center text-gray-400 font-light'>No data...</div>
              <div className='rounded w-[49.5%] h-80 bg-gray-100 animate-pulse flex items-center justify-center text-gray-400 font-light'>No data...</div>
            </div>
            <div className="w-full h-full bg-gray-100 rounded animate-pulse flex items-center justify-center text-gray-400 font-light">No data...</div>
          </div>

        </div>
        {/* <div className="w-[20%] h-full bg-gray-100 flex flex-col justify-between p-4">
          <div className="w-full flex flex-col space-y-4">
            <h1 className="text-sm font-bold mt-10">Re-stock History</h1>
            {stockHistory.length > 0 && (
              stockHistory.map((record, index) => (
                <button id={`${index}`} className="p-2 bg-gray-200 font-semibold rounded flex flex-col itens-start hover:shadow-xl transition duration-500 ease-in-out">
                  {record.timestamp}
                  <h1 className="text-xs font-bold">{record.stock}</h1>
                  <h1 className="bg-red-200 rounded-full text-red-600 p-1 text-xs font-light">{record.category}</h1>
                </button>
              ))
            )}
          </div>

          <div className="flex flex-col w-full space-y-2">
            <button className="p-2 h-12 border-2 border-[#2D57EB] font-semibold rounded text-[#2D57EB] hover:bg-[#2D57EB] hover:text-white transition duration-300 ease-in-out  active:bg-[#6D88E7]">Export Data</button>
            <button className="p-2 h-12 border-2 border-red-600 font-semibold rounded text-red-600 hover:bg-red-600 hover:text-white transition duration-300 ease-in-out active:bg-[#6D88E7]">Clear History</button>
          </div>
        </div> */}
      </div>
    </>
  )
}
