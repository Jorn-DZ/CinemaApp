import React from "react";
import { useNavigate } from "react-router-dom";

const BuyTicketButton = (props) => {
  const { movie } = props;
  const navigate = useNavigate();

  return (
    <button
      className="bg-white text-cyan-950 border-2 border-cyan-950 py-1 px-3 rounded-md w-32 hover:bg-cyan-950 hover:text-white hover:border-white absolute top-5 right-5"
      onClick={() => {
        navigate(`/${movie.id}/buyticket/${movie.titel}`);
      }}
    >
      Koop ticket
    </button>
  );
};

export default BuyTicketButton;
