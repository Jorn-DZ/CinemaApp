import React from "react";
import { useNavigate } from "react-router-dom";
/* eslint-disable react/prop-types*/

const Cards = ({ movie, userId }) => {
  const { movieId, titel, releaseDatum, cast, genre, beschrijving, thumbnail } =
    movie;
  const navigate = useNavigate();

  return (
    <div
      className="rounded-lg border shadow-xl h-full relative hover:cursor-pointer"
      onClick={() => {
        navigate(`/${userId}/movies/${titel}`);
      }}
    >
      <div className="rounded-lg h-[400px]">
        <img
          src={thumbnail}
          alt=""
          className="w-full h-full object-fill rounded-t-lg"
          loading="lazy"
        />
      </div>
      <div className="flex flex-wrap px-2 pt-2">
        {genre.map((g) => {
          return (
            <div key={g.id} className="px-1 py-1">
              <p className="px-2 bg-gray-100 rounded-md border border-gray-300 text-xs text-gray-400">
                {g.naam}
              </p>
            </div>
          );
        })}
      </div>
      <div className="pt-4 pb-20">
        <h1 className="text-center text-xl font-bold uppercase">{titel}</h1>
      </div>
      <div className="line-clamp-3 px-3 pt-1 mb-2 absolute bottom-0 border-t border-gray-300">
        <p className="text-sm">{beschrijving}</p>
      </div>
    </div>
  );
};

export default Cards;
