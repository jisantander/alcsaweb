namespace CobranzaALC.Dto
{
    using System;

    public class CabezeraActividadesExhortoDTO
    {
        private string deudor;
        private string noperacion;
        private string rol;
        private string roljuicio;
        private string tribunal;
        private string tribunaljuicio;

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

        public string Roljuicio
        {
            get
            {
                return this.roljuicio;
            }
            set
            {
                this.roljuicio = value;
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

        public string Tribunaljuicio
        {
            get
            {
                return this.tribunaljuicio;
            }
            set
            {
                this.tribunaljuicio = value;
            }
        }
    }
}

