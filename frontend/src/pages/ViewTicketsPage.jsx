import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import { getTickets } from "../api";
import ShowTickets from "../components/ShowTickets";

const ProfilePage = () => {
  const { id } = useParams();
  const [tickets, setTickets] = useState({ results: [] });
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchTickets = async () => {
      try {
        const response = await getTickets(id);
        setTickets({ results: response.data });
      } catch (error) {
        setError(error);
      } finally {
        setIsLoading(false);
      }
    };

    fetchTickets();
  }, []);

  if (isLoading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return <p>Er is een fout opgetreden!</p>;
  }

  if (tickets.results.length === 0) {
    return <p>Geen tickets</p>;
  }

  return (
    <div className="flex flex-wrap p-8">
      {tickets.results.map((t) => {
        return (
          <div key={t.id} className="px-6 py-4">
            <ShowTickets userTicket={t} />
          </div>
        );
      })}
    </div>
  );
};

export default ProfilePage;
