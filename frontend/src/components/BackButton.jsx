import React from "react";
import { useNavigate } from "react-router-dom";

const BackButton = (props) => {
  const navigate = useNavigate();

  return (
    <button
      className="bg-white text-cyan-950 border-2 border-cyan-950 py-1 px-3 rounded-md w-32 hover:bg-cyan-950 hover:text-white hover:border-white"
      {...props}
    >
      Ga terug
    </button>
  );
};

export default BackButton;
