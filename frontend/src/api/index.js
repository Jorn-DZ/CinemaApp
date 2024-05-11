import Axios from "axios";

export const getMovies = async () => {
  return await Axios.get("http://localhost:4205/film");
};

export const postTickets = async (ticket) => {
  return await Axios.post("http://localhost:4205/tickets", ticket);
};

export const getTickets = async (userId) => {
  return await Axios.get(`http://localhost:4205/tickets/${userId}`);
};

export const getTicketById = async (id, userId) => {
  return await Axios.get(
    `http://localhost:4205/tickets/${userId}/ticket/info/${id}`
  );
};

export const postUser = async (user) => {
  return await Axios.post("http://localhost:4205/users", user);
};

export const getUserById = async (userId) => {
  return await Axios.get(`http://localhost:4205/users/${userId}`);
};

export const loginUser = async (user) => {
  return await Axios.post(`http://localhost:4205/users/login`, user);
};

export const getShowByFilmAndTime = async (id, time) => {
  return await Axios.get(`http://localhost:4205/voorstellingen/${id}/${time}`);
};
