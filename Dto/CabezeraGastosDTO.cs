namespace CobranzaALC.Dto
{
    using System;

    public class CabezeraGastosDTO
    {
        private string deudor;
        private string noperacion;
        private string rol;
        private string tribunal;

        public string Deudor
        {
            get
            {
                return this.deudor;
            }
            set
            {
                this.deudor = value;
            }
        }

        public string Noperacion
        {
            get
            {
                return this.noperacion;
            }
            set
            {
                this.noperacion = value;
            }
        }

        public string Rol
        {
            get
            {
                return this.rol;
            }
            set
            {
                this.rol = value;
            }
        }

        public string Tribunal
        {
            get
            {
                return this.tribunal;
            }
            set
            {
                this.tribunal = value;
            }
        }
    }
}

