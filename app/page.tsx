"use client"
import { Sendifyy } from "sendifyy"

const page = () => {
  const handleSend = () => {
    const sendify = new Sendifyy()
    sendify.sendNotification(
      ["user123", "user456"],
      "Hello from Sendifyy! 🚀",
      "Click Me",
      "https://example.com"
    );
  }
  
  return (
    <div className="flex items-center justify-center h-screen">
      <button 
        onClick={handleSend} 
        className="px-4 py-2 bg-blue-500 text-white rounded-lg shadow-md hover:bg-blue-600 transition"
      >
        Send Notification
      </button>
    </div>
  )
}

export default page