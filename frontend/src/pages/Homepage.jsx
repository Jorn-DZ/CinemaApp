import React, { useState, useEffect } from "react";
import Cards from "../components/Cards";
import ProfileButton from "../components/ProfileButton";
import { useNavigate } from "react-router-dom";
import { getMovies, getUserById } from "../api";
import Cookies from "js-cookie";
import LogoutButton from "../components/LogoutButton";

const Homepage = () => {
  const [user, setUser] = useState(null);
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [userId, setUserId] = useState(0);
  const navigate = useNavigate();

  const [searchTerm, setSearchTerm] = useState("");
  const [filteredMovies, setFilteredMovies] = useState([]);

  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchUserData = async () => {
      const userToken = Cookies.get("token");

      if (userToken) {
        try {
          const userData = JSON.parse(atob(userToken.split(".")[1]));
          const userLoggedIn = userData.isLoggedIn;
          const user = await getUserById(userData.userId);

          setUser(user.data);
          setIsLoggedIn(userLoggedIn);
          setUserId(user.id);
        } catch (error) {
          console.error("Error while fetching user data", error.message);
        }
      }
    };
    fetchUserData();
  }, []);

  useEffect(() => {
    const fetchMovies = async () => {
      try {
        const response = await getMovies();
        const moviesData = response.data;
        let filteredMovies = moviesData;

        if (searchTerm) {
          filteredMovies = filteredMovies.filter((movie) =>
            movie.titel.toLowerCase().includes(searchTerm.toLowerCase())
          );
        }
        setFilteredMovies(filteredMovies);
      } catch (error) {
        setError(error);
      } finally {
        setIsLoading(false);
      }
    };

    fetchMovies();
  }, [searchTerm]);

  if (isLoading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return <p>Er is een fout opgetreden!</p>;
  }

  const triggerRerender = () => {
    window.location.reload(false);
  };

  return (
    <>
      <div>
        {user ? (
          <p className="text-white absolute top-6 right-20">
            Welkom {user.voornaam}!
          </p>
        ) : (
          ""
        )}
        <ProfileButton
          onClick={() => {
            if (!isLoggedIn) {
              navigate("/login");
            } else {
              navigate(`/tickets/${user.id}`);
            }
          }}
        />
      </div>
      <div>
        <LogoutButton
          className="absolute text-lg text-cyan-950 border-2 font-semibold border-cyan-950 top-5 rounded-md left-5 bg-white px-2 hover:bg-cyan-950 hover:text-white hover:border-white"
          onClick={() => {
            if (isLoggedIn) {
              Cookies.remove("token");
              triggerRerender();
            }
          }}
        >
          Log uit
        </LogoutButton>
      </div>
      <div className="flex justify-center">
        <div className="pt-4 pb-3">
          <input
            type="text"
            onChange={(e) => setSearchTerm(e.target.value)}
            value={searchTerm}
            className="bg-gray-200 rounded-md text-gray-500 pl-2 border border-gray-400"
            placeholder="Search"
          />
        </div>
      </div>
      <div className="grid 3xl:grid-cols-6 2xl:grid-cols-5 lg:grid-cols-4 md:grid-cols-3 sm:grid-cols-2">
        {filteredMovies.length > 0 ? (
          filteredMovies.map((m) => {
            return (
              <div
                key={m.id}
                className="px-8 py-4 transition ease-in-out delay-150 hover:-translate-y-1 hover:scale-110 duration-300"
              >
                <Cards
                  movie={{
                    movieId: m.id,
                    titel: m.titel,
                    releaseDatum: m.releaseDatum,
                    cast: m.cast,
                    genre: m.genre,
                    beschrijving: m.beschrijving,
                    thumbnail: m.thumbnail,
                  }}
                  userId={userId}
                />
              </div>
            );
          })
        ) : (
          <p>Geen films gevonden</p>
        )}
      </div>
    </>
  );
};

export default Homepage;
