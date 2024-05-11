import React from "react";
import { useNavigate } from "react-router-dom";
/* eslint-disable react/prop-types*/

const ShowTickets = (props) => {
  const { userTicket } = props;
  const navigate = useNavigate();

  return (
    <div className="w-[200px] h-[200px] relative">
      <div className="bg-white rounded-full w-[75px] h-[75px] z-10 absolute -left-10 top-1/3"></div>
      <img
        src={userTicket.voorstelling.film.thumbnail}
        alt=""
        className="w-full h-full object-cover hover:cursor-pointer"
        onClick={() => {
          navigate(`ticket/info/${userTicket.id}`);
        }}
      />
      <div className="bg-white rounded-full w-[75px] h-[75px] z-10 absolute -right-10 top-1/3"></div>
    </div>
  );
};

export default ShowTickets;
