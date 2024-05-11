import React from "react";
/* eslint-disable react/prop-types*/

const MovieDetails = (props) => {
  const { movie } = props;

  const getCast = () => {
    let wholeCast = [];

    movie.cast.map((c) => {
      let newCast = "";

      newCast = `${c.voornaam} ${c.achternaam}`;
      wholeCast.push(newCast);
    });
    return wholeCast;
  };

  const getDate = () => {
    const date = new Date(movie.releaseDatum);
    return date.toLocaleDateString();
  };

  return (
    <>
      <div className="w-full flex flex-wrap">
        <div className="w-1/5 h-2/3 mt-24 ml-12 border-2 border-cyan-950 rounded-md">
          <img
            src={movie.thumbnail}
            alt=""
            className="w-full h-full object-cover rounded-sm"
          />
        </div>
        <div className="w-3/4 mt-24">
          <div className="h-[15%] text-center">
            <div>
              <h1 className="text-2xl font-bold uppercase">{movie.titel}</h1>
            </div>
            <div>
              <p className="text-xs">Release date: {getDate()}</p>
            </div>
            <div className="flex flex-wrap justify-center">
              {movie.genre.map((g) => {
                return (
                  <div key={g.id} className="px-1 py-1">
                    <p className="px-2 bg-gray-100 rounded-md border border-gray-300 text-xs text-gray-400">
                      {g.naam}
                    </p>
                  </div>
                );
              })}
            </div>
          </div>
          <div className="flex flex-wrap h-[85%]">
            <div className="w-[40%] h-[85%] ml-[30%] text-center flex items-center">
              <p>{movie.beschrijving}</p>
            </div>
            <div className="w-full h-[15%] text-center">
              <p className="font-bold">Cast</p>
              <p className="font-semibold">{getCast().join(", ")}</p>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default MovieDetails;
