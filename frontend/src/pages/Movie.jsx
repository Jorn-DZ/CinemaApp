import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import BackButton from "../components/BackButton";
import MovieDetails from "../components/MovieDetails";
import BuyTicketButton from "../components/BuyTicketButton";
import { useNavigate } from "react-router-dom";
import { getMovies } from "../api";

const Movie = () => {
  const { title } = useParams();
  const [movies, setMovies] = useState({ results: [] });
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchParkings = async () => {
      try {
        const response = await getMovies();
        setMovies({ results: response.data });
      } catch (error) {
        setError(error);
      } finally {
        setIsLoading(false);
      }
    };

    fetchParkings();
  }, []);

  if (isLoading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return <p>Er is een fout opgetreden!</p>;
  }

  const movie = movies.results.find((m) => m.titel === title);

  return (
    <div>
      <div>
        <div className="absolute top-5 left-5">
          <BackButton
            onClick={() => {
              navigate(-1);
            }}
          />
        </div>

        <BuyTicketButton movie={movie} />
      </div>
      <div>
        <MovieDetails movie={movie} />
      </div>
    </div>
  );
};

export default Movie;
