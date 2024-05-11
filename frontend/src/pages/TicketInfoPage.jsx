import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getTicketById } from "../api";
import BackButton from "../components/BackButton";
import { useNavigate } from "react-router-dom";

const TicketInfoPage = () => {
  const { ticketId } = useParams();
  const { id } = useParams();

  const [ticket, setTicket] = useState({ results: [] });
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchTicket = async () => {
      try {
        const response = await getTicketById(ticketId, id);
        setTicket({ results: response.data });
      } catch (error) {
        setError(error);
      } finally {
        setIsLoading(false);
      }
    };

    fetchTicket();
  }, []);

  if (isLoading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return <p>Er is een fout opgetreden!</p>;
  }

  const getGenres = () => {
    let genres = [];

    ticket.results.voorstelling.film.genre.map((g) => {
      genres.push(g.naam);
    });

    return genres;
  };

  const getCast = () => {
    let wholeCast = [];

    ticket.results.voorstelling.film.cast.map((c) => {
      let newCast = "";

      newCast = `${c.voornaam} ${c.achternaam}`;
      wholeCast.push(newCast);
    });
    return wholeCast;
  };

  const getDate = (datum) => {
    const date = new Date(datum);
    return date.toLocaleDateString();
  };

  const getAmountTickets = () => {
    const stoelen = ticket.results.zitplaatsen;
    return stoelen.split(", ");
  };

  return (
    <div className="flex flex-wrap">
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
            src={ticket.results.voorstelling.film.thumbnail}
            alt=""
            className="w-full h-full object-cover blur-sm"
          />
        </div>
        <div className="pl-8 pt-6">
          <h1 className="uppercase text-3xl font-extrabold">
            {ticket.results.voorstelling.film.titel}
          </h1>
          <p>{ticket.results.voorstelling.film.beschrijving}</p>
          <p className="text-lg font-bold pt-4">GENRE(S)</p>
          <p>{getGenres().join(", ")}</p>
          <p className="text-lg font-bold pt-4">CAST</p>
          <p>{getCast().join(", ")}</p>
          <p className="text-lg font-bold pt-4">AANKOOPDATUM</p>
          <p className="text-md font-bold">
            {getDate(ticket.results.aankoopdatum)}
          </p>
          <p className="text-lg font-bold pt-4">{`DATUM EN TIJD: ${getDate(
            ticket.results.voorstelling.datum
          )} ${ticket.results.voorstelling.tijd}`}</p>
          <p className="text-lg font-bold pt-4">{`AANTAL TICKET(S): ${
            getAmountTickets().length
          }`}</p>
          <p className="text-lg font-bold pt-3">
            Stoel(en): {ticket.results.zitplaatsen}
          </p>
          <p className="text-lg font-bold pt-4">
            Totale prijs: {ticket.results.totalePrijs}
          </p>
        </div>
      </div>
    </div>
  );
};

export default TicketInfoPage;
