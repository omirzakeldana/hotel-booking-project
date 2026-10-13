import pyodbc

conn = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    r"SERVER=Eldana\SQLEXPRESS;"
    "DATABASE=HotelBookingProjectDB;"
    "Trusted_Connection=yes;"
    "TrustServerCertificate=yes;"
)

print("SQL Server-ге сәтті қосылды!")

cursor = conn.cursor()
cursor.execute("SELECT * FROM Klientter")

for klient in cursor.fetchall():
    print(klient)

conn.close()
