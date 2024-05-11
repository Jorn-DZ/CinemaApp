import React, { useState, useRef, useEffect } from "react";
import { useParams } from "react-router-dom";
import BackButton from "../components/BackButton";
import { useNavigate } from "react-router-dom";
import { getMovies, postTickets } from "../api";

const BuyTicketPage = () => {
  const { title } = useParams();
  const [tickets, setTickets] = useState(0);
  const [stoelen, setStoelen] = useState([]);
  const [timeSelected, setTimeSelected] = useState(false);
  const [selectedTimeState, setSelectedTimeState] = useState("");
  const seatRef = useRef();
  const timeRef = useRef();
  const errorRef = useRef();
  const navigate = useNavigate();

  const [movies, setMovies] = useState({ results: [] });
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchMovies = async () => {
      try {
        const response = await getMovies();
        setMovies({ results: response.data });
      } catch (error) {
        setError(error);
      } finally {
        setIsLoading(false);
      }
    };

    fetchMovies();
  }, []);

  if (isLoading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return <p>Er is een fout opgetreden!</p>;
  }

  const movie = movies.results.find((m) => m.titel === title);
  const voorstelling = movie.Voorstellingen.find(
    (v) => v.tijd === selectedTimeState
  );

  let seats = [];
  const times = ["19:30", "20:30", "22:00"];
  const amountOfSeats = 60;
  const selectedSeats = [22, 23, 58, 59, 35, 36, 37];

  const getDate = () => {
    const today = new Date();
    const month = today.getMonth() + 1;
    const year = today.getFullYear();
    const date = today.getDate();
    return `${date}/${month}/${year}`;
  };

  const clickedOnSeat = (index) => {
    const clickedSeat = seatRef.current.childNodes[index - 1];

    if (clickedSeat.classList.contains("bg-teal-400")) {
      clickedSeat.classList.add("bg-teal-600");
      clickedSeat.classList.remove("bg-teal-400");
      setTickets(tickets + 1);
      setStoelen([...stoelen, clickedSeat.textContent]);
    } else if (clickedSeat.classList.contains("bg-teal-600")) {
      clickedSeat.classList.add("bg-teal-400");
      clickedSeat.classList.remove("bg-teal-600");
      setTickets(tickets - 1);
      setStoelen((oldValues) => {
        return oldValues.filter((stoel) => stoel !== clickedSeat.textContent);
      });
    }
  };

  const createSeats = () => {
    for (let index = 1; index <= amountOfSeats; index++) {
      if (selectedSeats.includes(index)) {
        seats.push(
          <div
            key={index}
            className="w-[30px] h-[30px] bg-slate-100 text-center text-white font-semibold"
          >
            {index}
          </div>
        );
      } else {
        seats.push(
          <div
            key={index}
            className="w-[30px] h-[30px] bg-teal-400 text-center text-white font-semibold hover:cursor-pointer"
            onClick={() => {
              clickedOnSeat(index);
            }}
          >
            {index}
          </div>
        );
      }
    }
    return seats;
  };

  const timeSelect = (index) => {
    const selectedTime = timeRef.current.childNodes[index];

    selectedTime.classList.add("bg-black");
    selectedTime.classList.add("hover:text-black");
    selectedTime.classList.add("hover:bg-gray-100");
    selectedTime.classList.add("text-white");
    selectedTime.classList.remove("bg-gray-100");
    selectedTime.classList.remove("hover:text-white");
    selectedTime.classList.remove("hover:bg-black");
    setTimeSelected(true);
    getSelectedTime(index);
  };

  const timeDeselect = (index) => {
    const selectedTime = timeRef.current.childNodes[index];

    if (selectedTime.classList.contains("bg-black")) {
      selectedTime.classList.remove("bg-black");
      selectedTime.classList.remove("hover:text-black");
      selectedTime.classList.remove("hover:bg-gray-100");
      selectedTime.classList.remove("text-white");
      selectedTime.classList.add("bg-gray-100");
      selectedTime.classList.add("hover:text-white");
      selectedTime.classList.add("hover:bg-black");
      setTimeSelected(false);
    }
  };

  const getSelectedTime = (index) => {
    const selectedTime = timeRef.current.childNodes[index];
    setSelectedTimeState(selectedTime.textContent);
  };

  const getGenres = () => {
    let genres = [];

    movie.genre.map((g) => {
      genres.push(g.naam);
    });

    return genres;
  };

  const getCast = () => {
    let wholeCast = [];

    movie.cast.map((c) => {
      let newCast = "";

      newCast = `${c.voornaam} ${c.achternaam}`;
      wholeCast.push(newCast);
    });
    return wholeCast;
  };

  const allSeats = () => {
    console.log(seatRef.current.childNodes);
  };

  const makeTicket = () => {
    const ticket = {
      voorstellingenId: voorstelling.id,
      gebruikersId: 4,
      zitplaatsen: stoelen.join(", "),
    };
    postTickets(ticket);
  };

  return (
    <div>
      <div className="w-full h-[150px]">
        <div className="z-10 absolute top-4 left-3">
          <BackButton
            onClick={() => {
              navigate(-1);
            }}
          />
        </div>
        <img
          src={movie.thumbnail}
          alt=""
          className="w-full h-full object-cover blur-sm"
        />
      </div>
      <div className="pl-8 pt-6">
        <h1 className="uppercase text-3xl font-extrabold">{movie.titel}</h1>
        <p>{movie.beschrijving}</p>
        <p className="text-lg font-bold pt-4">GENRE(S)</p>
        <p>{getGenres().join(", ")}</p>
        <p className="text-lg font-bold pt-4">CAST</p>
        <p>{getCast().join(", ")}</p>
        <p className="text-lg font-bold pt-4">DATUM/TIJD</p>
        <p className="text-md font-bold">{getDate()}</p>
        <div className="flex flex-wrap gap-x-3 pt-2" ref={timeRef}>
          {times.map((t, index) => {
            return (
              <div
                key={t}
                ref={timeRef}
                className="bg-gray-100 border rounded-md hover:text-white hover:bg-black hover:cursor-pointer"
                onClick={() => {
                  if (!timeSelected) {
                    timeSelect(index);
                  } else {
                    timeDeselect(index);
                  }
                }}
              >
                <p className="font-semibold py-1 px-2">{t}</p>
              </div>
            );
          })}
        </div>
        <p className="text-lg font-bold pt-4">AANTAL TICKET(S)</p>
        <p className="text-lg font-bold">{tickets}</p>
        <p className="text-lg font-bold pt-3">KIES PLAATS(EN)</p>
      </div>
      <div className="pt-8">
        <div className="w-1/2 ml-[25%] h-2 rounded-md bg-cyan-950"></div>
        <div
          className="grid grid-cols-10 gap-y-3 gap-x-28 px-48 py-12"
          ref={seatRef}
        >
          {createSeats()}
        </div>
        <div className="pl-8 pb-6">
          <p
            className="text-red-600 pb-4"
            ref={errorRef}
            style={{ display: "none" }}
          >
            Gelieve zetels en een tijd te selecteren.
          </p>
          <button
            className="py-1 px-2 rounded-md font-medium text-white bg-teal-500 border-2 border-teal-950 hover:bg-teal-700"
            onClick={() => {
              if (timeSelected && tickets > 0) {
                allSeats();
                makeTicket();
                alert(
                  `Bedankt om ${tickets} ticket(s) te kopen voor ${movie.titel}`
                );
                window.location.reload(true);
              } else {
                const errText = errorRef.current;
                errText.style.display = "block";
              }
            }}
          >
            KOOP TICKET(S)
          </button>
        </div>
      </div>
    </div>
  );
};

export default BuyTicketPage;
