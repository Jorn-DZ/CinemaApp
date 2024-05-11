import React from "react";
import { useNavigate } from "react-router-dom";

const Nav = () => {
  const navigate = useNavigate();

  return (
    <div className="w-full bg-cyan-950 text-center">
      <button
        className="text-white py-6 hover:cursor-pointer hover:underline"
        onClick={() => {
          navigate("/");
        }}
      >
        Bioscoop
      </button>
    </div>
  );
};

export default Nav;
