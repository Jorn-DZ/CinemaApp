import React from "react";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import ReactDOM from "react-dom/client";
import "./index.css";
import Homepage from "./pages/Homepage";
import RootLayout from "./navigation/RootLayout";
import Movie from "./pages/Movie";
import BuyTicketPage from "./pages/BuyTicketPage";
import LoginPage from "./pages/LoginPage";
import RegisterPage from "./pages/RegisterPage";
import ViewTicketsPage from "./pages/ViewTicketsPage";
import TicketInfoPage from "./pages/TicketInfoPage";

const browserRouter = createBrowserRouter([
  {
    path: "/",
    element: <RootLayout />,
    children: [
      {
        path: "/",
        element: <Homepage />,
      },
      {
        path: ":id/movies/:title",
        element: <Movie />,
      },
      {
        path: ":id/buyticket/:title",
        element: <BuyTicketPage />,
      },
      {
        path: "tickets/:id",
        element: <ViewTicketsPage />,
      },
      {
        path: "tickets/:id/ticket/info/:ticketId",
        element: <TicketInfoPage />,
      },
    ],
  },
  {
    path: "/login",
    element: <LoginPage />,
  },
  {
    path: "/register",
    element: <RegisterPage />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={browserRouter}></RouterProvider>
  </React.StrictMode>
);
